class CommentsController < ApplicationController

	def create
		binding.pry
		@comment = Comment.new(username: params[:comment][:username], comment: params[:comment][:comment], movies_id: params[:comment][:movies_id] )

		@comment.save
		redirect_to movie_path(@movie)
		
	end

	def newç
		binding.pry
		@comment = Comment.new
		@movie = Movie.find_by(id: params[:movie_id])
		render 'new'
	end

end
