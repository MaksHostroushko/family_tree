Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'users#index'

  # get 'user/:id', to: 'users#show', as: 'user'

  resources :users
end
