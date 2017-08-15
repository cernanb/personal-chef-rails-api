class CreateHouseholdMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :household_meals do |t|
      t.references :household, foreign_key: true
      t.references :meal, foreign_key: true

      t.timestamps
    end
  end
end
