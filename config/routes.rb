Rails.application.routes.draw do
  devise_for :users
  get 'pages/about'
  get 'pages/contact'
  get 'home/index'
  get 'listings/index'
  get 'search' => 'search#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  resources :users, only: [:show, :edit, :update]
  resources :listings, only: [:new, :create, :show, :destroy, :edit, :update]
end