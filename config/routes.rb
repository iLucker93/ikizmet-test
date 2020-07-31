Rails.application.routes.draw do
  resources :clients, only: %i[index create]
  root to: 'clients#index'
end
