class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  after_create :get_user_instagram_user_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :achievements

  private

    def get_user_instagram_user_id
      response = instagram_client.user_search(self.instagram_username)
      user_id  = response[0]["id"]
      self.update_attributes(instagram_user_id: user_id)
    end

    def instagram_client
      Instagram.client(client_id: "#{ENV['WUNSCHCONCERT_INSTAGRAM_ID']}")
    end
end
