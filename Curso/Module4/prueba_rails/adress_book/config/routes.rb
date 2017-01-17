Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	get '/contacts/', to: 'contacts#index'
  	get '/contacts/showAll', to: 'contacts#showAll'
  	get '/contacts/new', to: 'contacts#new'
  	get '/contacts/:id', to: "contacts#show"
  	
	
  	post("/contacts", :to => "contacts#create")

end
