Rails.application.routes.draw do
  get 'about/me'

  resources :sessions
  # get 'sessions/new'

  get "login", to: "sessions#new", as: :login

  resources :photos
  resources :albums
  resources :links
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'articles#index'
  
end
