Rails.application.routes.draw do

  get 'users/new'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'relatives#index'

  # get 'user/:id', to: 'users#show', as: 'user'

  resources :users
  resources :relatives
end
