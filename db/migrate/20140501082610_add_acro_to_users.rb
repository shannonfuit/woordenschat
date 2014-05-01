class AddAcroToUsers < ActiveRecord::Migration
  def change
    add_column :users, :acro, :string
  end
end
