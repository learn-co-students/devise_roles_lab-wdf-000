Rails.application.routes.draw do
  devise_for :users

  # root to: 'users#index'
  root to: "visitors#index"

  get "/pages/about" => "visitors#about"

  resources :users
  resource :posts


end
