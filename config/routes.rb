Rails.application.routes.draw do
  resources :categories
  resources :brands
  devise_for :users
  
  resources :users do
    resources :orders do
      resources :order_items, only: [:create, :destroy]
    end
  end
  resources :products
  
  # Defines the root path route ("/")
  root "home#index"
end
