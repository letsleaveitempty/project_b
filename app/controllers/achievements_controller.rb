class AchievementsController < ApplicationController
  before_action :set_achievement, only: [:edit, :update, :destroy]

  def index
    current_user.achievements.each do |achievement|
      if achievement.status == "planned"
        fetch_and_save_user_media(achievement)
      end
    end

    @achievements = current_user.achievements
  end

  def show
    achievement = Achievement.find(params[:id])

    if achievement.status == "planned"
      fetch_and_save_user_media(achievement)
    end

    @achievement = achievement
  end

  def new
    @achievement = Achievement.new
  end

  def edit
  end

  def create
    @achievement = Achievement.new(achievement_params.merge(user_id: current_user.id, status: 'planned'))

    respond_to do |format|
      if @achievement.save
        format.html { redirect_to @achievement, notice: 'Achievement was successfully created.' }
        format.json { render :show, status: :created, location: @achievement }
      else
        format.html { render :new }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @achievement.update(achievement_params)
        format.html { redirect_to @achievement, notice: 'Achievement was successfully updated.' }
        format.json { render :show, status: :ok, location: @achievement }
      else
        format.html { render :edit }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @achievement.destroy
    respond_to do |format|
      format.html { redirect_to achievements_url, notice: 'Achievement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievement
      @achievement = Achievement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def achievement_params
      params.require(:achievement).permit(:name, :description, :hashtag, :status)
    end

    def instagram_client
      Instagram.client(client_id: "#{ENV['WUNSCHCONCERT_INSTAGRAM_ID']}")
    end

    def fetch_and_save_user_media(achievement)
      # run it on action show and once a day
      response = instagram_client.user_recent_media(current_user.instagram_user_id)
      response.each do |media|
        if media["tags"].include?(achievement.hashtag)

          achievement.update_attributes(
            image_direct_link: media["images"]["standard_resolution"]["url"],
            image_instagram_link: media["link"],
            instagram_caption: media["caption"]["text"],
            status: "done"
          )
        end
      end
    end
end
