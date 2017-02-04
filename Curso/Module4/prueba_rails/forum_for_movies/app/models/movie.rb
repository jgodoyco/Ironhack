class Movie < ApplicationRecord
	has_many :comments

	class << self
		def find_movies (title, movie)
			movies = Array.new
			if (movie == nil)
				movies_imdb = Imdb::Search.new(title)
				if (movies_imdb != nil)
					i=0
					num_movies=movies_imdb.movies.size
					while (i<20 && i< num_movies)					
						mov = movies_imdb.movies[i]
						movies[i] = Movie.new(title: mov.title, year: mov.year, sypnosis: mov.tagline, poster: mov.poster )
						i +=1
					end				
				end
			else
				movies[0] = movie
			end 
			return movies
		end

		
	end
end
