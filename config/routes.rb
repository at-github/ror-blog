Rails.application.routes.draw do
  root 'articles#index'

  resources :articles

  resources :users, only: %I[new create index]
  resources :user_sessions, only: %I[create destroy index]

  delete '/logout', to: 'user_sessions#destroy', as: :sign_out
  get '/login', to: 'user_sessions#new', as: :sign_in

  resources :links
end
