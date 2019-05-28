Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'

  resources :rentals, only: [:edit, :update]
  resources :spaceships, only: [:index, :show, :new, :create] do
    resources :rentals, only: [:new, :create]
  end
resources :search, only: [:index]
end
