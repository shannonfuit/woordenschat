class Question < ActiveRecord::Base
  belongs_to :level
  has_many :answers

  def next 
  	Question.where('id > ? AND level_id = ?', self.id, self.level_id).order(id: :asc).first
  end
end
