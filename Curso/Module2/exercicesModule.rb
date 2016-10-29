

#String Calculator

class StringCalculator
	def self.add(stringop)
		result = 0
		numeros=[stringop]
		if (stringop.include?(","))
			numeros = stringop.split(",")
		elsif (stringop.include?(";"))
			numeros = stringop.split(";")
		elsif (stringop.include?("\n"))
			numeros = stringop.split("\n")
		end

		numeros.each do |numero|
				result +=numero.to_i
		end
		
		return result
	end
end
