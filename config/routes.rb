Rails.application.routes.draw do
  root 'links#index'

  get 'login', to: 'sessions#new'
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create]
end
