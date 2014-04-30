class Question < ActiveRecord::Base
  belongs_to :level

  	def next
   		Question.first(:conditions => ['id > ? AND level_id = ?', self.id, self.level_id], :order => 'id ASC') 
 	end

end
