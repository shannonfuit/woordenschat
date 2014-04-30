class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :givenanswer
      t.boolean :answercorrect
      t.boolean :hintsemanticused
      t.boolean :hintsentenceused
      t.boolean :hintimageused
      t.integer :xp
      t.datetime :questionstarted
      t.datetime :questionfinished
      t.integer :playtime
      t.integer :level
      t.belongs_to :question, index: true

      t.timestamps
    end
  end
end
