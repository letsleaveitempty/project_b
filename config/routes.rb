Rails.application.routes.draw do

  root 'landing#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
  end
  resources :achievements

  # get '/oauth/connect'  => 'oauth#connect_with_oauth', as: :connect_with_oauth
  # get '/oauth/callback' => 'oauth#oauth_callback',     as: :oauth_callback
end
