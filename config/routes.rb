Rails.application.routes.draw do
  resources :responses, only: [:create, :update]
  resources :registrations, only: [:create]
  resources :elections, only: [:create]
end
