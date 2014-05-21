class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.belongs_to :user, index: true
      t.belongs_to :medal, index: true

      t.timestamps
    end
  end
end
