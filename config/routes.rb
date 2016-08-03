Rails.application.routes.draw do
  # devise_for :users

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

 	root to: 'users#index'
	resources :users, :posts

  
end
