class AddKlasToUser < ActiveRecord::Migration
  def change
    add_column :users, :klas, :string, :default => "4b"
  end
end
