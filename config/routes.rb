Rails.application.routes.draw do
  root 'links#index'

  get 'login', to: 'sessions#new'

  resources :users, only: [:new]
end
