class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :name
      t.text :description
      t.string :hashtag
      t.string :status

      t.timestamps null: false
    end
  end
end
