class AddUrlToMeals < ActiveRecord::Migration[5.1]
  def change
    add_column :meals, :url, :string
  end
end
