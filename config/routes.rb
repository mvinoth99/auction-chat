require 'sidekiq/web'

Rails.application.routes.draw do

  resources :products do 
    resources :bids
  end
  
  devise_for :users

  resources :conversations do 
    resources :messages
  end
  root to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
