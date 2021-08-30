Rails.application.routes.draw do
  get 'b_lists/new'
  get 'bugs/new'
  get 'sessions/new'
  get 'users/new'
  root 'static#new'
  get 'bugs/comment'
  resources :users
  resources :sessions
  resources :bugs
  resources :statuses

  end
