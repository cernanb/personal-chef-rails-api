class CreateMealNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :meal_notes do |t|
      t.string :content
      t.integer :meal_id
      t.timestamps
    end
  end
end
