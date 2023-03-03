Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    resources :orders do
      patch 'add_promo_code', on: :member
      patch 'remove_promo_code', on: :member
      resources :order_items, only: [:create, :update, :destroy ]
    end
    resources :favorites, only: [:index, :create, :destroy]
  end

  get 'admin/products', to: 'products#admin_products'
  get 'admin/categories', to: 'categories#admin_categories'
  get 'admin/brands', to: 'brands#admin_brands'
  get 'admin/colors', to: 'colors#admin_colors'
  get 'admin/promo_codes', to: 'promo_codes#admin_promo_codes'
  get 'admin/iconics', to: 'iconics#admin_iconics'
  get 'admin/users', to: 'users#admin_users'
  get 'admin/orders', to: 'orders#admin_orders'
  get 'admin/decorations', to: 'decorations#admin_decorations'
  
  resources :products
  resources :categories
  resources :brands
  resources :colors
  resources :promo_codes
  resources :iconics
  resources :decorations
  resources :collaborators, only: [:index]
  
  # Defines the root path route ("/")
  root "home#index"
end
