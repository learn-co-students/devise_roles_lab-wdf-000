Rails.application.routes.draw do
  get 'users/destroy'

  get 'users/new'

  get 'users/create'

  resources :posts
  devise_for :users

  root to: 'users#index'

  resources :users
end
