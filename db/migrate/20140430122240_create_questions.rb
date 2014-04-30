class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :word
      t.text :ans1
      t.text :ans2
      t.text :ans3
      t.text :ans4
      t.text :hintsemantic
      t.text :hintsentence
      t.string :hintimage
      t.integer :anscorrect
      t.belongs_to :level, index: true

      t.timestamps
    end
  end
end
