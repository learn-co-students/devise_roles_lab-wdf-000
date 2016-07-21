Rails.application.routes.draw do
  devise_for :views

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: 'users#index'

  resources :users

  resources :posts
end
