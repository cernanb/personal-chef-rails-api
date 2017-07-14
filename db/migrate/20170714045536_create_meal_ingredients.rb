class CreateMealIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :meal_ingredients do |t|
      t.references :ingredient, foreign_key: true
      t.references :meal, foreign_key: true
      t.string :measurement

      t.timestamps
    end
  end
end
