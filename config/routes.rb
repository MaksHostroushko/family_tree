Rails.application.routes.draw do

  ActiveAdmin.routes(self)

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
  devise_for :admin_users, ActiveAdmin::Devise.config

    root 'relatives#index'

    get 'sessions/new'
    get 'users/new'
    get 'signup',      to: 'users#new'
    post 'signup',     to: 'users#create'
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    # get '/users',      to: 'users#index'
    # get 'user/:id', to: 'users#show', as: 'user'

    resources :users
    resources :relatives do
      resources :categories
    end
    resources :categories
  end
end
