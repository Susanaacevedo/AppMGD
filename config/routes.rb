Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :contacts
  resources :goals

#  resources :productos
#  resources :detcarros
  get 'detcarros/create'
  resources :productos do
    resources :detcarros, only: :create
  end
  resources :detcarros, only: :index
  root to: 'home#index'


  resources :billings, only: [:index] do
    collection do
      get 'pre_pay'
      get 'execute'
    end
  end

  resources :detcarros, only: :index do
  	collection do
  		get 'clean'
  	end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
