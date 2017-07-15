class AddClientToHouseholds < ActiveRecord::Migration[5.1]
  def change
    add_column :households, :client?, :boolean, default: false
  end
end
