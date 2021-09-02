Rails.application.routes.draw do
  resources :channels
  resources :messages
  root "channels#index"
  devise_for :users
end
