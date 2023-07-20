Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :properties
  resources :favorites
  resources :fav_items

  root to: 'application#index'
end
