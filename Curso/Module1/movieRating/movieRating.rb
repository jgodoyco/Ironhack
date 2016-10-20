require 'imdb'

class ImdbMoviRating
	movies = IO.readlines("movies.txt");

	i = 0
	rating = []
	movie = []
	movies.each do |movie|		
		#peli = Imdb::Search.new(movie.trim)
		@peli = Imdb::Search.new(movie.strip)
		puts (" #{i+1} - #{movie}")
		puts (" --> #{@peli.movies.size}")
		puts (" --> #{@peli.movies[0].title}")
		ratingMovie = @peli.movies[0].rating
		puts (" --> #{ratingMovie}")
		puts (" ******************")		
		rating[i] = ratingMovie.to_i

		i += 1
	end  

	escala = (rating.max).round
	puts (" ESCALA MAXIMA :"+escala.to_s)

	ind = 0
	while escala > 0
		while ind < i
			if (rating[ind] < escala)
				print "| |"
			else
				print "|#|"
			end			
			ind += 1
		end
		puts " "
		ind=0
		escala -= 1
	end

end