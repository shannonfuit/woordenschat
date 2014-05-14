class Setdefaulthints < ActiveRecord::Migration
  def change
  	change_column :answers, :hintsemanticused, :boolean, :default => false
  	change_column :answers, :hintsentenceused, :boolean, :default => false
  	change_column :answers, :hintimageused, :boolean, :default => false
  end
end
