Rails.application.routes.draw do
  devise_for :users

  resources :media, only: [:index, :create, :destroy]
  resources :queue_items, only: [:index, :create, :destroy]

  get '/submit' => 'high_voltage/pages#show', id: 'process'
end
