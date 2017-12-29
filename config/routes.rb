Rails.application.routes.draw do
  resources :events, only: [:new, :show, :edit, :index, :update, :create, :destroy]
  resources :users, only: [:new, :show, :edit, :update, :create]
  resources :locations, only: [:new, :show, :edit, :index, :update, :create, :destroy]

  # resources :users do
  #   resources :rsvps
  # end

  # custom routes and root setup
  get '/signup', to: 'users#new', as: 'signup'
  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'
  resources :rsvps, only: [:create]
  root to: 'static#index'
end
