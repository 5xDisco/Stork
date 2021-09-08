Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }
# root to: "homes#index"
  # namespace :user do
  #   root :to => "spaces#list"
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "pages#home"
  
  resources :spaces 
  
  resources :channels

  resources :pages


  #get "/", to: "spaces#index"
 
  get "/stork/list", to: "pages#list"
  get "/stork/step1", to: "pages#step1"
  get "/stork/step2", to: "pages#step2"
  get "/stork/step3", to: "pages#step3"
  get "/invite", to: "invite_mailer#invite"
	get "/leave/:id", to: "channels#leave", as: "leave"
  get "/member", to: "channels#member", as: "member"
  get "/setting/:id", to: "channels#setting", as: "setting"


end
