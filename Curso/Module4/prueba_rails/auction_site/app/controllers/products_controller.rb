class ProductsController < ApplicationController

	def index
		@products = user.products.order(title: :asc).limit(30)
		render 'index'
	end

	def show
		@user = user
		@product = product
		@bid = Bid.new
		@bids = product.bids
		render 'show'
	end

	def create
		@product = user.products.new(product_param)
		if @product.save
			redirect_to user_products_path(user)
		else
			redirect_to 'index'
		end	
	end

	def destroy
		product.destroy
		redirect_to 'index'
	end

	def new
		@user = user
		@product = @user.products.new
		render 'new'
	end

	private
	def user
		@user = User.find_by(id: params[:user_id])
	end

	def product
		@product = user.products.find_by(id: params[:id])
	end

	def product_param
		params.require(:product).permit(:title ,:description ,:deadline)
	end

end
