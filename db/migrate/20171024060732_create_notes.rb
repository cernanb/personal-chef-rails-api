class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :content
      t.references :household, foreign_key: true

      t.timestamps
    end
  end
end
