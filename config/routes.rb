Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get '/profile', to: 'users/profiles#edit'
  end

  resources :spaces do
    resources :channels do
      resource :user_channels
      resources :messages
    end

    resources :direct_messages
  end


  resources :messages do
    member do
      get :reply
    end
    resources :replies
  end

  # resources :messages do
  #   member do
  #     get :reply
  #   end
  # end

  get ':space_id/:id/redirect', to: 'tasks#redirect', as: 'redirect'
  get '/callback', to: 'tasks#callback', as: 'callback'
  get '/calendars', to: 'tasks#calendars', as: 'calendars'
  get '/events.json', to: 'tasks#calendear_events', as: 'events'
  get '/new_event', to: 'tasks#new_event', as: 'new_event'
  post '/create_event', to: 'tasks#create_event', as: 'create_event'


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
