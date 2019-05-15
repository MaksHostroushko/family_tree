Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  ActiveAdmin.routes(self)

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
  devise_for :admin_users, ActiveAdmin::Devise.config

    root 'relatives#index'

    # get 'sessions/new'
    # get 'users/new'
    # get 'signup',      to: 'users#new'
    # post 'signup',     to: 'users#create'
    # get    '/login',   to: 'sessions#new'
    # post   '/login',   to: 'sessions#create'
    # delete '/logout',  to: 'sessions#destroy'

    get '/collaborators/new',      to: 'users#add_collaborator'
    get '/collaborators',      to: 'users#collaborators'

    resources :users do
      member do
        get :following, :followers
      end
    end
    resources :categories
    resources :authentications, only: [:destroy]
    resources :relatives do
      resources :categories
    end
    resources :relationships,  only: [:create, :destroy]
  end
end
