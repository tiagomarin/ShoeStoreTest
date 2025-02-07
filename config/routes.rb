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
  get 'admin/archived', to: 'products#admin_archived'
  get 'admin/brands', to: 'brands#admin_brands'
  get 'admin/colors', to: 'colors#admin_colors'
  get 'admin/sizes', to: 'sizes#admin_sizes'
  get 'admin/promo_codes', to: 'promo_codes#admin_promo_codes'
  get 'admin/iconics', to: 'iconics#admin_iconics'
  get 'admin/users', to: 'users#admin_users'
  get 'admin/orders', to: 'orders#admin_orders'
  get 'admin/decorations', to: 'decorations#admin_decorations'
  get 'admin/genders', to: 'genders#admin_genders'
  get 'admin/categories', to: 'categories#admin_categories'
  get 'admin/category_home', to: 'home_categories#admin_home_category'
  get 'admin/collections', to: 'collections#admin_collections'
  get 'admin/collection_home', to: 'home_collections#admin_home_collection'

  resources :products
  resources :brands
  resources :colors
  resources :sizes
  resources :genders
  resources :collections
  resources :home_collections
  resources :categories
  resources :home_categories
  resources :promo_codes
  resources :iconics
  resources :decorations
  resources :collaborators, only: [:index]
  
  # Defines the root path route ("/")
  root "home#index"
end
