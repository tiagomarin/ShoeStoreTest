Rails.application.routes.draw do
  resources :users do
    resources :orders
  end
  resources :products

  # Defines the root path route ("/")
  root "home#index"
end
