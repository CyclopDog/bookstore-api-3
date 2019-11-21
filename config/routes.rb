Rails.application.routes.draw do
  resources :users, only: [:new, :show, :create]
  resources :books, only: [:index, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
end
