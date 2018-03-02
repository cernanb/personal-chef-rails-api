class RenameClientOnHouseholds < ActiveRecord::Migration[5.1]
  def change
    rename_column :households, :client?, :client
  end
end
