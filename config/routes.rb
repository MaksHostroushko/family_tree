Rails.application.routes.draw do

  root 'users#index'

  # get 'user/:id', to: 'users#show', as: 'user'

  resources :users
end
