class AddAvatarToUser < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string, :default => 'default'
  end
end
