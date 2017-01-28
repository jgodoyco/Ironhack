Rails.application.routes.draw do
	
  resources :products, only: [:index ,:show ] do
  	resources :bids , only: [ :create ] 
  end 
 
  resources :users, only: [:index, :new, :show, :create, :destroy] do
  	resources :products, only: [:index, :new, :show, :create, :destroy ] 
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
