Rails.application.routes.draw do
  get 'home/index'
  resources :categoria
  resources :ingredientes
  resources :pratos
  resources :restaurantes

  root :to => "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
