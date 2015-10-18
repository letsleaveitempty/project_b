class AddIgDescriptionToAchievements < ActiveRecord::Migration
  def change
    add_column :achievements, :instagram_caption, :string
    rename_column :achievements, :hashtags, :hashtag
  end
end
