Rails.application.routes.draw do
  resources :events
  resources :users, only: [:new, :show, :edit, :update, :create]
end
