Rails.application.routes.draw do

  devise_for :users
  #root to: "homes#index"

  root to: "channels#index"
  resources :channels

	get "/leave/:id", to: "channels#leave", as: "leave"
  get "/member", to: "channels#member", as: "member"
  get "/setting/:id", to: "channels#setting", as: "setting"
end
