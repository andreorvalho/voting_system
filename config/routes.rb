Rails.application.routes.draw do
  resources :registrations, only: [:create]
  resources :elections, only: [:create]
end
