<<<<<<< HEAD
Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }
# root to: "homes#index"
  # namespace :user do
  #   root :to => "spaces#list"
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

<<<<<<< HEAD
  root to: "spaces#index"
  resources :channels
  resources :spaces

  #get "/", to: "spaces#index"
  get "/spaces", to: "spaces#index", as: "logout"
  get "/signin", to: "spaces#signin"
  get "/login", to: "spaces#login"
  get "/list", to: "spaces#list"
  get "/invite", to: "spaces#invite"
  get "/crt_channel", to: "spaces#crt_channel"
=======
  root to: "pages#index"
  
  resources :spaces 
  resources :channels
  resources :pages


  #get "/", to: "spaces#index"
  get "/spaces", to: "pages#index", as: "logout"
  # get "/signin", to: "spaces#signin"
  # get "/login", to: "spaces#login"
  get "/stork/list", to: "pages#list"
  get "/stork/step1", to: "pages#new"
  get "/stork/step2", to: "pages#step2"
  get "/stork/step3", to: "pages#step3"
>>>>>>> 50d94c1... AddPagesController
	get "/leave/:id", to: "channels#leave", as: "leave"
  get "/member", to: "channels#member", as: "member"
  get "/setting/:id", to: "channels#setting", as: "setting"
end

