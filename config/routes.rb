Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
  end
  root to: "restaurants#index"
  resources :users, only: [:show] do
    get :followings, on: :member
    get :followers, on: :member
  end

  resources :restaurants do
    resources :comments, only: :create
    post 'add' => 'likes#create'
    delete '/add' => 'likes#destroy'
  end

  resources :relationships, only: [:create, :destroy]
end
