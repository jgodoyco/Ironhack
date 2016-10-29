class FizzBuzz

	def testNumber(number)
		
		test=number

		if (number % 3 == 0)
			test = "fizz"
		end
		if (number % 5 == 0)
			test = "buzz" 
		end
		if ((number % 5 == 0)&&(number % 3 == 0))
			test = "fizzbuzz" 
		end

		return test
	end	
	
end
