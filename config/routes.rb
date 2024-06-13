Rails.application.routes.draw do
  require "sidekiq/web"
  # Sidekiq Web UI, only for admins.
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  resources :matchs
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :paris
  resources :profils
  resources :items do
    resources :inventories, only: [:create]
  end
  resources :inventories, only: [:index]

  patch "inventories/:id/equipped", to: "inventories#equipped", as: :inventory_equipped
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
