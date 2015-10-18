class AddFieldsToAchievement < ActiveRecord::Migration
  def change
    add_column :achievements, :instagram_username,   :string
    add_column :achievements, :instagram_user_id,    :string
    add_column :achievements, :image_direct_link,    :string
    add_column :achievements, :image_instagram_link, :string
  end
end
