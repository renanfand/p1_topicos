Rails.application.routes.draw do
  get 'busca/index'
  resources :categories
  get 'home/index'
  resources :ingredientes
  resources :pratos
  resources :restaurantes do
    collection do
      get 'homepage'
      post 'homepage'
    end
  end
  root 'restaurantes#homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
