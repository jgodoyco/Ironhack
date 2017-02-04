Rails.application.routes.draw do

	resources :comments, only: [:new ,:create ]
  
  resources :movies do
  	resources :comments
  end

  post '/movies/search', to: "movies#search"
  put '/movies/update', to: "movies#update"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
