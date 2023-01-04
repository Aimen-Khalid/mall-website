Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'custom_registrations', sessions: "custom_sessions" }
  root "stores#index"
  resources :users do
    resources :carts, only: [:show]
  end
    resources :stores do
    resources :products
  end

  get '/stores/:store_id/products/:id/add_to_cart', to: 'products#add_to_cart', as: 'add_to_cart_store_product'
  get '/user/:user_id/cart/:id/checkout', to: 'carts#checkout', as: 'checkout_cart'
  get '/stores/:store_id/products/:id/remove_from_cart', to: 'products#remove_from_cart', as: 'remove_from_cart_store_product'
  devise_scope :user do
  get'/log_out', to:'custom_sessions#log_out', as: :log_out
  end
end
