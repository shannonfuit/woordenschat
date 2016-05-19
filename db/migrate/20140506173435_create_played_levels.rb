class CreatePlayedLevels < ActiveRecord::Migration
  def change
    create_table :played_levels do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :seconds
      t.boolean :level_completed, default: false
      t.integer :stars, default: 0
      t.belongs_to :level, index: true
      t.belongs_to :user, index: true
      t.integer :count_correct, default: 0
      t.integer :level_xp, default: 0

      t.timestamps
    end
  end
end
