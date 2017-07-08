class CreateHouseholds < ActiveRecord::Migration[5.1]
  def change
    create_table :households do |t|
      t.string :name
      t.string :address
      t.integer :monthly_rate

      t.timestamps
    end
  end
end
