Rails.application.routes.draw do
  devise_for :users
  root to: "restaurants#index"
  resources :users, only: :show
  resources :restaurants, only: [:new, :create]
end
