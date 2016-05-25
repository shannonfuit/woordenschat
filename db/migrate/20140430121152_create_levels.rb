class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.integer :number
      t.datetime :openingdate
      t.datetime :closed_at

      t.timestamps
    end
  end
end
