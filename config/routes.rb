<<<<<<< HEAD
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
=======
Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#index"

  resources :channels
  #root "channels#index"

	get "/leave/:id(.:format)", to: "channels#leave", as: "leave"
  get "/member", to: "channels#member", as: "member"
  get "/setting/:id(.:format)", to: "channels#setting", as: "setting"
end
>>>>>>> 8826ab7... 新增假刪除功能
