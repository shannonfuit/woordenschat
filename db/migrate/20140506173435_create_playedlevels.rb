class CreatePlayedlevels < ActiveRecord::Migration
  def change
    create_table :playedlevels do |t|
      t.datetime :startlevel
      t.datetime :finishlevel
      t.integer :playtime
      t.boolean :levelcompleted, :default => false
      t.integer :stars, :default => 0
      t.belongs_to :level, index: true
      t.belongs_to :user, index: true
      t.integer :correctquestions, :default => 0
      t.integer :levelxp, :default => 0

      t.timestamps
    end
  end
end
