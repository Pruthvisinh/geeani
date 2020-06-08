Rails.application.routes.draw do
  get 'home/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }#, controllers: {omniauth_callbacks: 'omniauth'}
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Social login
  get '/auth/:provider/callback', to: 'sessions#create'
  #match '/auth/:provider/callback', to: 'sessions#omniauth_create'

end
