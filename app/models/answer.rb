class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  belongs_to :playedlevel

  def submit(given_answer, played_level)
    # TODO: refactor the whole hints thing, it's totally incomprehensible
    self.seconds = (Time.zone.now - created_at).to_i
    self.given_answer = given_answer.to_i
    self.playedlevel = played_level
    self.correct_answered = self.given_answer == question.anscorrect
    if correct_answered? && seconds < 30
      self.xp = if used_semantic_hint || used_sentence_hint || used_image_hint
                  50
                else
                  100
                end
    end
    save
  end
end
