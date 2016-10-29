require "pry"

class Lexiconomitron

	def eat_t (word)
		return (word.gsub('t', '')).gsub('T','')
	end

	def shazam (array_of_words)
		result = []
		array_of_words.each_with_index do |word, ind|
			if (ind==0)			
				result << eat_t(word.reverse)
			elsif (ind==array_of_words.length-1)
				result << eat_t(word.reverse)
			end
		end
		return result
	end

	def oompa_loompa (array_of_words)
		result = []
		array_of_words.each do |word|
			if (word.length<4)			
				result << eat_t(word)
			end
		end
		return result
	end

end