Rails.application.routes.draw do
  get 'orders/new'
  devise_for :users
  get 'pages/about'
  get 'pages/contact'
  get 'listings/brass'
  get 'listings/percussion'
  get 'listings/string'
  
  get 'success', to: "orders#create"
  get 'search' => 'search#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  resources :users, only: [:show, :edit, :update]
  resources :listings, only: [:index, :new, :create, :show, :destroy, :edit, :update]
  resources :orders
end