class AddXpToUser < ActiveRecord::Migration
  def change
    add_column :users, :xp, :integer, :default => 0
  end
end
