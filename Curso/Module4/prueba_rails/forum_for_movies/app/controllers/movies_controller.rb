class MoviesController < ApplicationController

	def index
		@movie = Movie.new
		render 'index'
	end

	def show
		@movie = Movie.find_by(id: params[:id])
		@comments = Comment.where(movies_id: params[:id]).order(username: :asc).limit(30);
		render 'show'
	end

	def search
		@movies = Movie.find_movies(params[:title], movie_db)
		render 'search'
	end

	def update
		@movie = Movie.new(title: params[:title], year: params[:year], poster: params[:poster], sypnosis: params[:sypnosis]  )
		if (@movie.save)
			redirect_to movie_path(@movie.id)
		else
			redirect_to movies_path
		end	
	end

	def movie_db		
		@movie = Movie.find_by(title: params[:title])
	end

end
