class AddUserIdToHouseholds < ActiveRecord::Migration[5.1]
  def change
    add_column :households, :user_id, :integer
  end
end
