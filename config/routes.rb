Rails.application.routes.draw do
  devise_for :users

  resources :media, only: [:index, :create, :destroy]
  resources :queue_items, only: [:index, :create, :destroy]

  authenticate :user do
    get '/submit' => 'high_voltage/pages#show', id: 'process'
    post '/validate' => 'media#validate'
  end
end
