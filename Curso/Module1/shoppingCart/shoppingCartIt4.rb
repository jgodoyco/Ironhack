class Shop
  def initialize (lista)
    @items = lista
  end

  def printItems
  	puts "Lista de Items Disponibles en esta TIENDA "
  	puts "******************************************"
  	@items.each do |item|
  		item.printItem
  	end
  end

  def showMe
  	while true do
	  puts "\e[H\e[2J"
	  printItems
	  puts "***********************"
	  puts "* MENU SHOP *"
	  puts "***********************"
	  puts "1) AÑADIR PRODUCTO A LA TIENDA"
	  puts ""
	  puts "2) GESTION DE PEDIDOS"
	  puts ""
	  print "Elige OPCION -->"
	  opcion = 0
	  opcion = gets.chomp.to_i

	  if opcion == 1  
	    addItem
	    puts "Opcion TIENDA #{opcion} COMPLETADA. Pulse Intro para continuar."
	    gets.chomp
	  elsif opcion == 2
	    pedido = ShoppingCart.new(@items)
	    pedido.shoppingCartManagement
	    puts ""
	    puts "Opcion TIENDA #{opcion} COMPLETADA. Pulse Intro para continuar."
	    gets.chomp
	  else
	    puts "Opcion TIENDA #{opcion} INCORRECTA. Pulse Intro para continuar."
	    gets.chomp
	  end  
	end
  end

  def add_item_lista(item)
      @items << item
      puts "*** Item AÑADIDO ***"
      printItems
  end

  def addItem
      #Add your item to @items
      puts "Añade Item a la Tienda"
      puts "***********************"
      puts "Tipo Item disponibles ya"
      @items.each do |item|
        puts "Familia: #{item.family}"        
      end
      print "Selecciona Familia Item-->"
      family = gets.chomp      
      puts ""
      print "Selecciona tipo Item-->"
      nameItem = gets.chomp
      puts ""
      print "Selecciona precio Item-->"
      priceItem = gets.chomp.to_i
      puts ""      
      add_item_lista(Item.new(family,nameItem,priceItem))
      
  end

end

class ShoppingCart
  attr_accessor :shopProducts
  attr_accessor :itemsCart

  def initialize (productos)
  	@shopProducts = productos
  	@itemsCart = []
  end

  def printTotalCost    
  	printItemsCart

    total = 0
    print "COSTE TOTAL Shopping CART: ["
    infinal= @itemsCart.length
    i=0
    @itemsCart.each do |itemInd|
      if(itemInd!=nil)
	      print @shopProducts[i].price.to_s
	      print " * "
	      print itemInd.to_s
	      i +=1
	      if i<infinal-1 
	        print " + "
	      end
	      total += (@shopProducts[i].price * itemInd)
	   end
    end
    print "] = "
    print total.to_s
    puts " $"
  end 

  def addItemCart
  	printItemsShop
  	puts "---> Selecciona producto a Añadir :"
  	producto = gets.chomp
  	puts "---> Selecciona el numero de #{producto}s a Añadir :"
  	numero = gets.chomp.to_i
  	unidadesCompradas=itemsCart[busca(producto)]
  	if (unidadesCompradas!=nil)
  		@itemsCart[busca(producto)]= unidadesCompradas+numero
  	else
  		@itemsCart[busca(producto)]= numero
  	end
  end

  def busca(productName)
  	ind = 0
  	sigue = true
  	while(sigue) 
  		sigue = ((@shopProducts[ind].name!=productName)&&(ind < shopProducts.length))
  		if sigue 
  			ind +=1
  		end
  	end
  	return ind
  end

  def shoppingCartManagement
  	while true do
	  puts "\e[H\e[2J"
	  printItemsShop
	  puts "***************************"
	  puts "* MENU GESTION DE PEDIDOS *"
	  puts "***************************"
	  puts "1) AÑADIR PRODUCTO AL PEDIDO"
	  puts ""
	  puts "2) CALCULA COSTE PEDIDO"
	  puts ""
	  puts "3) LISTA PEDIDO"
	  puts ""
	  print "Elige OPCION -->"
	  opcion = gets.chomp.to_i

	  if opcion == 1  
	    addItemCart
	    puts "Opcion #{opcion} COMPLETADA. Pulse Intro para continuar."
	    gets.chomp
	  elsif opcion == 2
	    printTotalCost
	    puts "Opcion #{opcion} COMPLETADA. Pulse Intro para continuar."
	    gets.chomp
	  elsif opcion == 3
	    printItemsCart
	    puts "Opcion #{opcion} COMPLETADA. Pulse Intro para continuar."
	    gets.chomp
	  else
	    puts "Opcion #{opcion} INCORRECTA. Pulse Intro para continuar."
	    gets.chomp
	  end  
	end
  end

  def printItemsShop
  	puts "Lista de Productos que Puedes Comprar en la TIENDA"
  	puts "**************************************************"
  	@shopProducts.each do |item|
  		item.printItem
  	end
  end

  def printItemsCart
  	puts "Lista de Productos en tu PEDIDO"
  	puts "*******************************"
  	ind = 0
  	@itemsCart.each do |itemNumber|
  		if (itemNumber!=nil)
  			puts "#{itemNumber}: #{shopProducts[ind].name}s"
  		end
  		ind +=1
  	end
  end

end

class Item  

  attr_accessor :family, :name, :price

  def initialize(family, name, price)
  	  @family = family
      @name = name
      @price = price
      @isWeekend =false
  end

  def printItem
  	puts "-->#{@family} - #{@name} : [ price: #{price} $ ] "
  end
end

items = [ Item.new("Fruit", "apple", 10), Item.new("Fruit", "grape", 15), Item.new("Fruit", "watermelon", 50), Item.new("Fruit", "orange", 5), Item.new("Fruit","banana", 20) ]
tienda = Shop.new (items)
tienda.showMe

