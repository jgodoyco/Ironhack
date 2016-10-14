
class Car
	def initialize (sound_local)
		@sound = sound_local
		coches_creados = IO.read("numCoches.txt").to_i + 1 
		IO.write( "numCoches.txt", coches_creados.to_s)
	end

	def make_noise
		puts @sound
	end
	def cuentaCoches
		puts "Creaste "+ @@coches_creados.to_s+" coches YA !!!"
	end

	def self.dev_coches_creados
		IO.read("numCoches.txt")
	end
end

class RacingCar < Car
	def initialize (sound_local)		
		@sound = "BROOOOM"		
	end
end


#Car.new("Brooooommmm").make_noise
#Car.new("Raaaaan, Raaaannn").make_noise
#RacingCar.new("Pepito").make_noise
#puts Car.dev_coches_creados 

class Person
	attr_reader :name
	attr_accessor :age

	def initialize (namePerson, agePerson)
		@name = namePerson
		@age = agePerson
	end 
end

juan = Person.new("Juan", 34)

#puts juan.name
#puts juan.age


