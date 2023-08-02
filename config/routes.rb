# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'room/index'
  devise_for :users, controllers: { registrations: 'registrations' }

  get 'users', to: 'users#index', as: :users_with_properties

  resources :properties do
    member do
      post :add_to_cart
    end
    resources :reviews
  end

  resources :news, only: [:index]

  resources :favorites, only: %i[index create destroy]
  resources :fav_items

  get '/button_click', to: 'properties#button_click_action', as: 'button_click'

  # post 'contact_now/:property_id', to: 'users#contact_now', as: :contact_now

  resources :rooms do
    resources :messages
  end

  resources :cart_items, only: [:destroy]

  resource :cart, only: [:show]

  get 'users/:id', to: 'users#show', as: 'user'

  root to: 'application#index'
end
