Rails.application.routes.draw do

  get 'users/new'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'relatives#index'

  # get 'user/:id', to: 'users#show', as: 'user'

  resources :users
  resources :relatives
end
