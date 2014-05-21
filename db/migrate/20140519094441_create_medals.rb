class CreateMedals < ActiveRecord::Migration
  def change
    create_table :medals do |t|
      t.string :name
      t.text :description
      t.integer :xp

      t.timestamps
    end
  end
end
