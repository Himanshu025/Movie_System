Rails.application.routes.draw do
  resources :users
  resources :movies
  resources :theatres
  resources :audis
  resources :bookings
  resources :tickets
  resources :show_times
end
