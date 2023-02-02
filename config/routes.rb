Rails.application.routes.draw do
  resources :options
  resources :registrations, only: [:create]
  resources :elections, only: [:create]
end
