
## Ejercicios Ruby
## Modulo 1
## Sabado 8 Octubre

def sayHello 

	array = ["Jack", "Wally", "Joey"];


	array.each do |nombre|
		puts ("Buenos días sr. #{nombre}" );
	end

end


def printCitiesCapitalized

	cities =["madrid", "barcelona", "tokio", "merida", "lima", "nueva york", "ciudad de mexico"];

	cities.map { |ciudad| 
		if !(ciudad.include?(" ")) then 
			puts ciudad.capitalize 
		else 
			array = ciudad.split;
			array.each do |parte_ciudad| 
				if (parte_ciudad != "de") then
					print parte_ciudad.capitalize
				else
					print parte_ciudad
				end
				print " "
			end
			puts "";
		end 
	};

end

def sumaArrays

	array = [1,3,45,63,66,7]

	suma = array.reduce do |prim,segundo| prim+segundo end
	puts  suma;

end

def avgLengthCities

	cities =["madrid", "barcelona", "tokio", "merida", "lima", "nueva york", 
		"ciudad de mexico"];

	suma = cities.reduce(0) do 
		|memo,city| memo + city.length 
	end
	puts  suma/cities.length;

end


#sayHello();

#printCitiesCapitalized();

#sumaArrays;

avgLengthCities();