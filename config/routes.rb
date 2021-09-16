Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
# root to: "homes#index"
  # namespace :user do
  #   root :to => "spaces#list"
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "pages#home"
  
  resources :spaces do 
    resources :channels
  end
  
  resources :messages
  resources :pages

  #get "/", to: "spaces#index"
  get "/stork/test", to: "pages#test"

  get "/stork/list", to: "pages#list"
  get "/stork/step1", to: "pages#step1"
  get "/stork/step2", to: "pages#step2"
  get "/stork/step3", to: "pages#step3"
	get "/spaces/:space_id/leave/:id", to: "channels#leave", as: "leave"
  get "/member/:id", to: "channels#member", as: "member"

  get "/member/add/:id", to: "channels#memberadd", as: "member_add"
  post "/member/add/:id", to: "channels#memberdoadd", as: "member_add_post"

  get "/spaces/:space_id/setting/:id", to: "channels#setting", as: "setting"

  post '/invite', to: 'pages#invite'

end
