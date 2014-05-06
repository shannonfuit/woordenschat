class Level < ActiveRecord::Base
	has_many :questions
	has_many :playedlevels
end
