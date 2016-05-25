# Answer of the user on a question
class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  belongs_to :round

  scope :correct, -> { where(correct_answered: true) }

  def submit(given_answer)
    update(
      seconds: (Time.zone.now - created_at).to_i,
      given_answer: given_answer.to_i,
      round: round,
      correct_answered: given_answer.to_i == question.anscorrect
    )
    self.xp = calculate_xp
    save
  end

  private

  def calculate_xp
    return 0 unless correct_answered? && seconds < 30
    hint_used? ? 50 : 100
  end

  def hint_used?
    used_semantic_hint? || used_sentence_hint? || used_image_hint?
  end
end
