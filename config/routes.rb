Rails.application.routes.draw do
  get 'users/new'

  resources :posts
  devise_for :users

  root to: 'users#index'

  resources :users
end
