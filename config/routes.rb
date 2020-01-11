Rails.application.routes.draw do
  resources :goals
  root to: 'home#index'
  resources :productos
  resources :detcarros
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
