Rails.application.routes.draw do
devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions',
  omniauth_callbacks: 'users/omniauth_callbacks',
}

  root to: "pages#home"
  
  resources :spaces do 
    resources :channels do
      resource :user_channels
      resources :messages
    end
  
    resources :direct_messages
  end

	get "/spaces/:space_id/leave/:id", to: "channels#leave", as: "leave"
  get "/member/:id", to: "channels#member", as: "member"

  get "/member/:space_id/add/:id", to: "channels#member_add", as: "member_add"
  post "/member/:space_id/add/:id", to: "channels#member_doadd", as: "member_add_post"
  get "/welcome", to: "channels#member_accept", as: "member_accept"

  get "/spaces/:space_id/setting/:id", to: "channels#setting", as: "setting"

  post '/invite', to: 'pages#invite'
  get "/stork/test", to: "pages#test"

  get "/stork/list", to: "pages#list"
  get "/stork/step1", to: "pages#step1"
  get "/stork/step2", to: "pages#step2"
  get "/stork/step3", to: "pages#step3"
end
