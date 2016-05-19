class Setdefaulthints < ActiveRecord::Migration
  def change
  	change_column :answers, :used_semantic_hint, :boolean, :default => false
  	change_column :answers, :used_sentence_hint, :boolean, :default => false
  	change_column :answers, :used_image_hint, :boolean, :default => false
  end
end
