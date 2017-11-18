class CreateEngagementMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :engagement_meals do |t|
      t.integer :meal_id
      t.integer :engagement_id
      t.timestamps
    end
  end
end
