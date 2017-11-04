class CreateEngagements < ActiveRecord::Migration[5.1]
  def change
    create_table :engagements do |t|
      t.references :household, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
