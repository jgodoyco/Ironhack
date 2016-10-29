require_relative "./exercicesModule.rb"

class StringCalculatorTest

	def self.test
		puts

		result = StringCalculator.add("")
		puts "StringCalculator.add('')"
		puts result
		puts "RESULTADO DEL TEST :#{result==0}"

		puts

		result = StringCalculator.add("5")
		puts "StringCalculator.add('5')"
		puts result
		puts "RESULTADO DEL TEST :#{result==5}"

		puts

		result = StringCalculator.add("5,3")
		puts "StringCalculator.add('5,3')"
		puts result
		puts "RESULTADO DEL TEST :#{result==8}"

		puts

		result = StringCalculator.add("2,3,4,5")
		puts "StringCalculator.add('2,3,4,5')"
		puts result
		puts "RESULTADO DEL TEST :#{result==14}"		
	end

end

puts StringCalculatorTest.test