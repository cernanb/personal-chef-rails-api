class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.integer :household_id

      t.timestamps
    end
  end
end
