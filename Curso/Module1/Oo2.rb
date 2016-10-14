#class Car
#	def initialize(sound_local, engine)
#		@sound = sound_local
#		@engine = engine
#	end
#
#	def make_noise
#		puts "#{@sound} #{@engine.dev_noise}"
#	end
#end

#class Engine
#	def initialize(sound_local)
#		@sound = sound_local
#	end

#	def dev_noise
#		return @sound
#	end
#end



#motor1 = Engine.new("Brmmmm")
#motor2 = Engine.new("Primmm")

#coche1 = Car.new("click click", motor1)
#coche2 = Car.new("click click", motor2)


#coche1.make_noise
#coche2.make_noise


class Car
	def initialize(sound_local, num_wheels)
		@sound = sound_local
		@num_wheels = num_wheels
	end

	def count_wheel
			return @num_wheels
	end

	def make_noise
		puts "#{@sound}"
	end
end

class Motocicle
	def initialize(sound_local, num_wheels)
		@sound = sound_local
		@num_wheels = num_wheels
	end

	def count_wheel
			return @num_wheels
	end

	def make_noise
		puts "#{@sound}"
	end
end

class Truck
	def initialize(sound_local, num_wheels)
		@sound = sound_local
		@num_wheels = num_wheels
	end

	def count_wheel
			return @num_wheels
	end

	def make_noise
		puts "#{@sound}"
	end
end

class Vehicles

	def initialize(array_vehicles)
		@array_vehicles = array_vehicles
	end

	def countWheels
		counter=0;
		@array_vehicles.each do |vehicle|
			counter = counter + vehicle.count_wheel
		end
		return counter
	end

	def makeSounds
		@array_vehicles.each do |vehicle|
			vehicle.make_noise
		end
	end	
end

vehicle0 = Motocicle.new("tlinnnnn", 2)
vehicle1 = Truck.new("superBRRRRRR", 16)
vehicle2 = Car.new("mmmmmmmm", 4)

array_vehicles = [vehicle0, vehicle1, vehicle2]

puts Vehicles.new(array_vehicles).countWheels
Vehicles.new(array_vehicles).makeSounds