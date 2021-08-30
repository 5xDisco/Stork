Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }
# root to: "homes#index"
  # namespace :user do
  #   root :to => "spaces#list"
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "spaces#index"
  
  resources :spaces

  #get "/", to: "spaces#index"
  get "/spaces", to: "spaces#index", as: "logout"
  get "/signin", to: "spaces#signin"
  get "/login", to: "spaces#login"
  get "/list", to: "spaces#list"
  get "/invite", to: "spaces#invite"
  get "/crt_channel", to: "spaces#crt_channel"



end
