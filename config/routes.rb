Rails.application.routes.draw do
  root to: 'home#index'
  resources :campagnas
  resources :meta
  resources :productos
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
