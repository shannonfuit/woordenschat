class AddLevelnumberToMedals < ActiveRecord::Migration
  def change
    add_column :medals, :levelnumber, :integer
  end
end
