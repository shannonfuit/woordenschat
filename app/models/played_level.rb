class PlayedLevel < ActiveRecord::Base
  belongs_to :level
  belongs_to :user
  has_many :answers

  def end
    score = score
    update(
      ended_at: Time.zone.now,
      seconds: (Time.zone.now - started_at).to_i,
      level_completed: true,
      level_xp: answers.sum(:xp),
      count_correct: answers.where(correct_answered: true).count
    )
    if ended_at < level.closingdate && ended_at > level.openingdate
      self.stars = 0
      puts answers.where(correct_answered: true).count
      # puts score
      # if 6...8.include? score then self.stars = 1
    #   elsif 8...10.include? score then self.stars = 2
    #   elsif score == 10 then self.stars = 3
    #   end
    end
    save
  end

  def score
    (answers.where(correct_answered: true).count.to_f / level.questions.count.to_f) * 10
  end
end
