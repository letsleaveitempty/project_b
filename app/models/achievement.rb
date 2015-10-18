class Achievement < ActiveRecord::Base

  validates :name,     presence: true
  validates :user_id,  presence: true
  validates :hashtag,  presence: true, uniqueness: {scope: :user_id}
  validates :status,   presence: true

  scope :planned, -> { where(status: 'planned') }
  scope :done, -> { where(status: 'done') }

end
