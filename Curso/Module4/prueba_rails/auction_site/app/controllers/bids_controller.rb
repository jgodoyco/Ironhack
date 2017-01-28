class BidsController < ApplicationController

	def new
		@bid = Bid.new
		render 'new'
	end

	def create
		@bid = Bid.new(bid_param)
		if @bid.save
			redirect_to user_product_path(user)
		else
			redirect_to new_user_product_bid_path()
		end	
	end

	private
		def user
			@user = User.find_by(id: params[:user_id])
		end

		def product
			@product = user.products.find_by(id: params[:id])
		end

		def bid
			@bid = user.product.bids.find_by(id: params[:id])
		end
		
		def bid_param
			params.require(:bid).permit(:amount ,:user_id ,:product_id)
		end
	
end
