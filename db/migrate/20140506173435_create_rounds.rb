class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.datetime :ended_at
      t.integer :seconds
      t.integer :stars, default: 0
      t.belongs_to :level, index: true
      t.belongs_to :user, index: true
      t.integer :count_correct, default: 0
      t.integer :level_xp, default: 0

      t.timestamps
    end
  end
end
