class FixAvatar < ActiveRecord::Migration

  def change
    rename_column :users, :avatar, :picture
  end
end