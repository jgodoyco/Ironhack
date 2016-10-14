class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end

  def to_s
  	print name
  	print " in "
  	print city 
	print " , capacity: "
  	puts capacity
	print "Price: $"
  	print price
  	print " a nigth."  	
  end
end



def iniHouses
	homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Pepe's place", "Málaga", 2, 45),
  Home.new("Juan's place", "Madrid", 1, 32),
  Home.new("Paco's place", "Vigo", 3, 54),
  Home.new("Isabel's place", "Málaga", 2, 43),
  Home.new("Rodrigo's place", "Seville", 2, 42),
  Home.new("Carla's place", "Madrid", 4, 67),
  Home.new("Daniela's place", "Madrid", 2, 43)
	]

  return homes;
end

def printHouses(houses)
	puts ("******** LISTA DE CASAS ************ ");
	houses.each do |house|
		puts house.to_s;
	end

end

def avgPrices(houses)

	prices = houses.map do |house|
  		house.price;
  	end

  	addPrices = prices.reduce(0) do |h1,h2|
  		h1+h2;
  	end

  	return addPrices / prices.length;

end

def sortBy (houses,typeOfSort)

	sorted = houses.sort do |home1, home2|	

		if (typeOfSort == "1")
  			home2.price <=> home1.price
  		elsif (typeOfSort == "2")
  			home1.capacity <=> home2.capacity
  		else
  			home1.price <=> home2.price
		end

	end
	return sorted;
end


houses = iniHouses();

printHouses( sortBy(houses,0) );

while (true)
	puts ("******** MENU ***********");
	puts ("0) Ordena por Precio Menor a Mayor");
	puts ("1) Ordena por Precio Mayor a Menor");
	puts ("2) Ordena por Capacidad Mayor");
	puts ("3) Filtra por Ciudad");
	puts ("4) Filtra por Precio");

	opcion = gets.chomp.to_i

	if (opcion<2)
		printHouses(sortBy(houses,opcion) );
	elsif (opcion ==3 )
		puts ("3) Filtra por Ciudad, dime la ciudad: ");
		ciudad = gets.chomp		
		city_homes = houses.select do |hm|
  			hm.city == ciudad
		end
		printHouses(city_homes);
		puts ("*** Quieres saber la media de precios de casas en esta ciudad (S/N) : ");
		mediaPrecio = gets.chomp
		if (mediaPrecio == "S")
			puts "Media Precios : #{avgPrices(city_homes)}";			
		end
	elsif (opcion =4)
		puts ("*** 4) Indique el precio de filtro : ");
		precio_home = gets.chomp.to_i
		home_by_price = houses.find do |hm|
  			hm.price == precio_home
		end
		puts home_by_price.to_s;
	
	end


end

#puts "Media Precios : #{avgPrices(houses)}";
