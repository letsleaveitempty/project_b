class OauthController < ApplicationController

  skip_before_action :authenticate_user!

  CALLBACK_URL = "http://localhost:4567/oauth/callback"

  # def connect_with_oauth
  #   redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  # end
  #
  # def oauth_callback
  #   response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  #   session[:access_token] = response.access_token
  #   redirect_to achievements_path
  # end
end
