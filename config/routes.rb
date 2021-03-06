Rails.application.routes.draw do
  root 'links#index'

  get 'login', to: 'sessions#new'
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create]
  resources :links, only: [:create, :edit, :update]

  namespace 'api' do
    namespace 'v1' do
      resources :links, only: [:update]
    end
  end
end
