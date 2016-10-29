
class CheckerSubject

	def check(palabras, subjects)
		if ((subjects == nil)||(subjects == []))
			return false
		else
			result = false
			if(palabras!=nil)				
				subjects.each do |subject|

					if(!result)
						result = estanPalabrasSubject?(palabras, subject)
					end

				end
			end
			return result
		end

	end

	def estanPalabrasSubject? (palabras, subject)
		estantodas = true
		palabras.each do |palabra|
			estantodas = estantodas && subject.include?(palabra)
		end
		return estantodas
	end

end