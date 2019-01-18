Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'relatives#index'

  get 'sessions/new'
  get 'users/new'
  get 'signup',      to: 'users#new'
  post 'signup',     to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # get 'user/:id', to: 'users#show', as: 'user'

  resources :users
  resources :relatives
end
