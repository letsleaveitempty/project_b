class AchievementsController < ApplicationController
  before_action :set_achievement, only: [:show, :edit, :update, :destroy]

  def index
    get_user_instagram_id
    @achievements = current_user.achievements
  end

  def show
  end

  def new
    @achievement = Achievement.new
  end

  def edit
  end

  def create
    @achievement = Achievement.new(achievement_params)

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
      params.require(:achievement).permit(:name, :description, :hashtags, :status).merge(user_id: current_user.id, status: 'planned')
    end

    def get_user_instagram_id
      response = instagram_client.user_search("letsleaveitempty")
      user_id  = response[0]["id"]
      get_user_media(user_id, "berlin")
    end

    def instagram_client
      Instagram.client(client_id: '5ab7145c032945608d7ebcf66059bef3')
    end

    def get_user_media(user_id, tag)
      response = instagram_client.user_recent_media(user_id)
      response.each do |media|
        if media["tags"].include?(tag)
          #save the pic to achievement and update status
          puts media["link"]
        end
      end
    end
end
