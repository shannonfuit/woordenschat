class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :given_answer
      t.boolean :correct_answered
      t.boolean :used_semantic_hint
      t.boolean :used_sentence_hint
      t.boolean :used_image_hint
      t.integer :xp, default: 0
      t.integer :seconds
      t.integer :level
      t.belongs_to :question, index: true

      t.timestamps
    end
  end
end
