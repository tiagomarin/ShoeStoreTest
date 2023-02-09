Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    resources :orders do
      resources :order_items, only: [:create, :destroy]
    end
  end
  resources :products
  resources :categories
  resources :brands
  
  # Defines the root path route ("/")
  root "home#index"
end
