class Achievement < ActiveRecord::Base

  validates :name,     presence: true
  validates :user_id,  presence: true
  validates :hashtags, presence: true
  validates :status,   presence: true

end
