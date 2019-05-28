Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'

  resources :rentals, only: [:edit, :update] do
    get 'accept', to: 'rentals#accept'
    get 'decline', to: 'rentals#decline'
  end
  resources :spaceships, only: [:index, :show, :new, :create] do
    resources :rentals, only: [:new, :create]
  end
resources :search, only: [:index]
end
