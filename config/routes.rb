Rails.application.routes.draw do
  devise_for :users

  resources :media, only: [:index, :create, :destroy]
  resources :queue_items, only: [:index, :create, :destroy]
end
