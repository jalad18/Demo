Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :properties do
    resources :reviews
  end
  resources :favorites, only: [:create, :destroy]
  resources :fav_items

  resources :rooms
  #resources :users, only: [:show]
  #get "user/:id", to: "user#show", as: "user"

  root to: 'application#index'
end
