Rails.application.routes.draw do

  root 'landing#index'
  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks", registrations: 'registrations' }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
  end
  resources :achievements

end
