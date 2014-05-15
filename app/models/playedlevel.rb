class Playedlevel < ActiveRecord::Base
  belongs_to :level
  belongs_to :user
  has_many :answers

  def levelfinished
  	self.finishlevel = Time.now
    self.playtime = (self.finishlevel - self.startlevel).to_i
    self.levelcompleted = true
    self.levelxp = self.answers.sum(:xp)
    self.correctquestions = self.answers.where(answercorrect: true).count

    if self.finishlevel < self.level.closingdate
	    if self.correctquestions == 1
	    	self.stars = 1
	    elsif self.correctquestions == 2
	    	self.stars = 2
	    elsif self.correctquestions == 3
	    	self.stars = 3
	    end
    end
  end

  def self.maximumstars (current_user, level)
    Playedlevel.where('user_id > ? AND level_id = ?', current_user, level).order(stars: :desc).first
  end

end
