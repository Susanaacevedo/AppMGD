Rails.application.routes.draw do
  resources :goals

#  resources :productos
#  resources :detcarros
  get 'detcarros/create'
  resources :productos do
    resources :detcarros, only: :create
  end
  resources :detcarros, only: :index
  root to: 'home#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
