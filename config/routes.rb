require 'sidekiq/web'

Rails.application.routes.draw do
  get 'myproducts', to: 'products#myproducts'
  get 'myorders' , to:'orders#index'
  resources :products do 
    resources :bids
  end
  
  devise_for :users

  resources :conversations do 
    resources :messages
  end
  root to: 'products#index'

  get '*path', to: 'home#doesnotexist', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
