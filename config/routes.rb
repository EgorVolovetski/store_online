Rails.application.routes.draw do
  resources :carts
  resources :products
   devise_for :users
  get 'user/index'
  get 'home/index'
  root 'home#index'
  get "up" => "rails/health#show", as: :rails_health_check
end
