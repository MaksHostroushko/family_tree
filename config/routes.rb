Rails.application.routes.draw do

  get 'emails/new'
  get 'emails/create'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  ActiveAdmin.routes(self)

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    devise_for :admin_users, ActiveAdmin::Devise.config

    root 'relatives#index'

    get '/collaborators/new',      to: 'users#add_collaborator'
    get '/collaborators',      to: 'users#collaborators'

    resources :categories
    resources :authentications, only: [:destroy]
    resources :relationships,  only: [:create, :destroy]
    resources :emails,  only: :create
    resources :pages, only: :show
    resources :users do
      member do
        get :following, :followers
      end
    end
    resources :relatives do
      resources :categories
    end
  end
end
