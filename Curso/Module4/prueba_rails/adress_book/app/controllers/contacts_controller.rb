class ContactsController < ApplicationController

	def new
		@contact = Contact.new
		render 'new'
	end

	def showAll
		@contacts = Contact.order(created_at: :desc).limit(20);
		render 'showAll'
	end

	def show
		@contact = Contact.find_by(id: params[:id]);
		if @contact.present?
			render 'show'
		else
			render 'Error_No_Project_finder'
		end
	end

	def new
		@contact = Contact.new
		render 'new'
	end

 	def create
		@contact = Contact.new(name: params[:contact][:name], adress: params[:contact][:address], phone_number: params[:contact][:phone], email_address: params[:contact][:email] )
		
		if (@contact.save)
			#redirect_to "/contacts/#{@contact.id}"
			render(:text => @contact.attributes)
		else
			
			redirect_to "/contacts/new"
		end

		
	end
end
