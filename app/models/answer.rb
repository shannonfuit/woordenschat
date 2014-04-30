class Answer < ActiveRecord::Base
  belongs_to :question

	#answers the question
  def answer (answer)
  	self.questionfinished = Time.now
  	self.givenanswer = answer
    self.answercorrect = (self.givenanswer == self.question.anscorrect)
    if (self.answercorrect?)
        self.xp = 100
    else
    	self.xp = 0
    end
    elapsed_seconds = (self.questionfinished - self.questionstarted).to_i
    self.playtime = elapsed_seconds
  end

end
