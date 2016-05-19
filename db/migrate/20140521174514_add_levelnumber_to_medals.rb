class AddLevelnumberToMedals < ActiveRecord::Migration
  def change
    add_column :medals, :level_number, :integer
  end
end
