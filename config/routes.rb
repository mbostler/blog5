Rails.application.routes.draw do
  resources :photos
  resources :albums
  resources :links
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
