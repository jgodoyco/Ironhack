class BidsController < ApplicationController

	def create
		if (User.exists?(:email => params[:email]))
			# User Bid
			@user = user					
			@bid = Bid.create(amount: params[:bid][:amount].to_i ,user_id: @user.id , product_id: params[:product_id])			
			@bid.save
			redirect_to user_product_path(product.user, product)
		end
	end

	private
		def user
			@user = User.find_by(email: params[:email])
		end
		
		def product			
			@product = Product.find_by(id: params[:product_id])
		end
	
end