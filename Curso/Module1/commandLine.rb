class User

	def self.checkUserPass? (username, password)
		check = false
		if ((username == "jgodoyco")&&(password =="pepito"))
			check = true
		end
		return check
	end
end


class CommandLine
	attr_reader :User

	def initialize
		intentos = 0
		sigue = true;
		while (sigue)  
			puts ("IDENTIFICATE !!")
			puts ("Escribe tu usuario :")
			print (" > ")
			usuario = gets.chomp
			puts ("Ahora escribe tu password :")
			print (" > ")
			password = gets.chomp

			if (User.checkUserPass?(usuario,password))
				while (sigue)
					puts ("MENU COMMAND LINE")
					puts ("=================")
					puts ("1) Contar Palabras")
					puts ("2) Contar Letras")					
					puts ("3) Girar Palabra")
					puts ("4) MAYUSCULAS Palabras")
					puts ("5) minusculas Palabras")

					puts ("Escribe la opción que desees :")
					print (" > ")
					opcion = gets.chomp.to_i
					if ((opcion >0)&&(opcion <6))

						puts ("Escribe el texto sobre el que desees hacer la operación :")
						print (" > ")
						texto = gets.chomp
						puts ("La operación deseada sobre el texto te da el siguiente resultado :")
						result=""
						if (opcion == 1)
							result= TextOperations.cuentaPalabras(texto).to_s
						elsif (opcion == 2)
							result= TextOperations.cuentaletras(texto).to_s
						elsif (opcion == 3)
							result= TextOperations.reverse(texto)
						elsif (opcion == 4)
							result= TextOperations.upcase(texto)
						elsif (opcion == 5)			
							result= TextOperations.downcase(texto)			
						end	
						puts ("Respuesta: #{result}")

					end
				end
			else
				puts ("Usuario o password INCORRECTOS!!")
				intentos += intentos
				if intentos>3
					sigue = false
					puts ("Maximo intentos utilizados")
				end
			end
			
		end
	end
end

class TextOperations

	def self.cuentaPalabras(texto)
		return texto.split(" ").count
	end
	def self.cuentaletras(texto)
		return texto.gsub(/[\s_\W\d1234567890]/, "").length
	end
	def self.reverse(texto)
		return texto.reverse!
	end
	def self.upcase(texto)
		return texto.upcase
	end
	def self.downcase(texto)
		return texto.downcase
	end

end


comm = CommandLine.new()