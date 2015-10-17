Rails.application.routes.draw do

  root 'landing#index'
  resources :achievements
  devise_for :users

  # get '/oauth/connect'  => 'oauth#connect_with_oauth', as: :connect_with_oauth
  # get '/oauth/callback' => 'oauth#oauth_callback',     as: :oauth_callback
end
