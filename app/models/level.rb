class Level < ActiveRecord::Base
	has_many :questions
	has_many :playedlevels

 	def next 
  		Question.where('id > ? AND level_id = ?', self.id, self.level_id).order(id: :asc).first
  	end	
end