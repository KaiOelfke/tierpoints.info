require 'sidekiq/web'

Rails.application.routes.draw do
  get 'runs/new'
  get 'runs/create'
  namespace :admin do
      resources :users
      resources :announcements
      resources :notifications
      resources :runs

      root to: "users#index"
    end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

  post     'new_run' => 'runs#create'
  get      'new_run' => 'runs#new'

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
