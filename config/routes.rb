Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "spaces#index"

  get "/", to: "spaces#index"
  get "/spaces", to: "spaces#index"
  get "/signin", to: "spaces#signin"
  get "/login", to: "spaces#login"
  get "/list", to: "spaces#list"

  resources :spaces

end