Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :properties do
    resources :reviews
  end
  resources :favorites
  resources :fav_items

  root to: 'application#index'
end
