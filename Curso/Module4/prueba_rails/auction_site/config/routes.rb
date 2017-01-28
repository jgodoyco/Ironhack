Rails.application.routes.draw do
	
  resources :users, only: [:index, :new, :show, :create, :destroy] do
  	resources :products, only: [:index, :new, :show, :create, :destroy ] do 
  	  resources :bids, only: [:new, :create ] 
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
