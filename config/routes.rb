Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:index, :create]
  resources :items do
   resources :orders, only: [:index, :new, :create]
  end
  
end

