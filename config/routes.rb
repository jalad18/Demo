Rails.application.routes.draw do
  #get 'room/index'
  devise_for :users, controllers: {registrations: 'registrations'}

  resources :properties do
    resources :reviews
  end
  resources :favorites, only: [:index, :create, :destroy]
  resources :fav_items


  get '/button_click', to: 'properties#button_click_action', as: 'button_click'

  resources :rooms do
    resources :messages
  end

  #get "properties/:id", to: "properties#show"
  #resources :users, only: [:show]
  get "users/:id", to: "users#show", as: "user"

  root to: 'application#index'
end
