class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  belongs_to :played_level

  scope :correct, -> { where(correct_answered: true) }

  def submit(given_answer)
    update_attributes(
      seconds: (Time.zone.now - created_at).to_i,
      given_answer: given_answer.to_i,
      played_level: played_level,
      correct_answered: given_answer.to_i == question.anscorrect,
      xp: calculate_xp
    )
  end

  private

  def calculate_xp
    return 0 unless correct_answered? && seconds < 30
    used_hint ? 50 : 100
  end

  def used_hint?
    used_semantic_hint? || used_sentence_hint? || used_image_hint?
  end
end
