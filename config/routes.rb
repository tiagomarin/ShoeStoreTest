Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :orders
  end
  resources :products
  

  # Defines the root path route ("/")
  root "home#index"
end
