Rails.application.routes.draw do
  resources :responses
  resources :options
  resources :registrations, only: [:create]
  resources :elections, only: [:create]
end
