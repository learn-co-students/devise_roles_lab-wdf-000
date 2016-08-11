Rails.application.routes.draw do

  resources :posts
  devise_for :users
  resources :users, as: 'users'


  root to: 'users#index'


end
