Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	get '/', to: 'site#home'
	get 'contact/', to: 'site#contact'

	get 'calculator/', to: 'calculator#calculator'
	post 'calculate/', to: 'calculator#calculate'

	get '/projects', to: "projects#index"
	get '/projects/new', to: "projects#new"
  	get '/projects/:id', to: "projects#show"
  	post '/projects/', to: "projects#create"

end
