class LandingController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if current_user
      redirect_to achievements_path
    end
  end
end
