class UsersController < ApplicationController
	
	def index
		@users = User.order(name: :asc).limit(30);
		render 'index'
	end

	def show
		if user.present?
			render 'show'
		else
			flash[:notice] = "New User creation Error"
			render 'Error_User'
		end
	end

	def new
		@user = User.new
		render 'new'
	end

 	def create
		@user = User.new(name: params[:user][:name], email: params[:user][:email] )
		
		if (@user.save)
			redirect_to user_path(@user)
		else
			
			redirect_to "/users/new"
		end		
	end

	def destroy
		user.destroy
		redirect_to users_path
	end

	private 
	def user
		@user = User.find_by(id: params[:id])
	end
end
