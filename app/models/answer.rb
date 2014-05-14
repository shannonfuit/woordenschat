class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  belongs_to :playedlevel

	#answers the question
  def finishquestion (answer)
  	self.questionfinished = Time.now
  	self.givenanswer = answer
    self.answercorrect = (self.givenanswer == self.question.anscorrect)
    if (self.answercorrect?)
        if (self.hintsemanticused? || self.hintsentenceused? || self.hintimageused?)
          self.xp = 50
        else
          self.xp = 100
        end
    else
    	self.xp = 0
    end

    elapsed_seconds = (self.questionfinished - self.questionstarted).to_i
    self.playtime = elapsed_seconds
  end

end
