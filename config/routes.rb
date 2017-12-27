Rails.application.routes.draw do
  resources :events, only: [:new, :show, :edit, :update, :create]
  resources :users, only: [:new, :show, :edit, :update, :create]

  # custom routes and root setup
  get '/signup', to: 'users#new', as: 'signup'
  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'
  root to: 'static#index'
end
