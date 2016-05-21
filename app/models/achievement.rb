# medals won by user
class Achievement < ActiveRecord::Base
  belongs_to :user
  belongs_to :medal
end
