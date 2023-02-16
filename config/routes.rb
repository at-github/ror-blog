Rails.application.routes.draw do
  root 'articles#index'

  resources :articles do
    resources :comments
  end

  resources :users
  resources :user_sessions, only: %I[create destroy index]

  delete '/logout', to: 'user_sessions#destroy', as: :sign_out
  get '/login', to: 'user_sessions#new', as: :sign_in

  resources :links

  match '/404', to: 'errors#not_found', via: :all
end
