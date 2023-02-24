Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    resources :orders do
      patch 'add_promo_code', on: :member
      patch 'remove_promo_code', on: :member
      resources :order_items, only: [:create, :update, :destroy ]
    end
  end
  
  resources :products
  resources :categories
  resources :brands
  resources :promo_codes
  
  # Defines the root path route ("/")
  root "home#index"
end
