# a level played by a user
class PlayedLevel < ActiveRecord::Base
  belongs_to :level
  belongs_to :user
  has_many :answers

  def close
    update(
      ended_at: Time.zone.now,
      seconds: (Time.zone.now - created_at).to_i,
      level_xp: answers.sum(:xp),
      count_correct: answers.correct.count
    )
    score_stars
    save
  end

  def score_stars
    return 0 unless ended_at.between? level.openingdate, level.closed_at
    self.stars = case grade
                 when 6...8 then 1
                 when 8...10 then 2
                 when 10 then 3
                 else 0
                 end
  end

  def grade
    (answers.correct.count.to_f / level.questions.count.to_f) * 10
  end
end
