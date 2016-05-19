class Playedlevel < ActiveRecord::Base
  belongs_to :level
  belongs_to :user
  has_many :answers

  def levelfinished
  	self.ended_at = Time.now
    self.seconds = (self.ended_at - self.startlevel).to_i
    self.levelcompleted = true
    self.levelxp = self.answers.sum(:xp)
    self.correctquestions = self.answers.where(correct_answered: true).count
    
    self.stars = 0
    if self.ended_at < self.level.closingdate  && self.ended_at > self.level.openingdate
      if 6 <= self.score && self.score < 8
        self.stars = 1
      elsif 8 <= self.score && self.score < 10
        self.stars = 2
      elsif self.score == 10
        self.stars = 3
      end
    end

    #if self.ended_at < self.level.closingdate
	    # if self.correctquestions >= 18 && self.correctquestions < 24
	    # 	self.stars = 1
	    # elsif self.correctquestions >= 24 && self.correctquestions < 30
	    # 	self.stars = 2
	    # elsif self.correctquestions == 30
     #    self.stars = 3
	    # end
    #end
  end

  def score
    (self.correct_count.to_f / self.level.questions.count.to_f) * 10
  end

  def self.maximumstars (current_user, level)
    Playedlevel.where('user_id > ? AND level_id = ?', current_user, level).order(stars: :desc).first
  end

protected
  def correct_count
    self.correctquestions
  end
end
