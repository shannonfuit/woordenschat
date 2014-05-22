class Medal < ActiveRecord::Base
	#has_many :achievements

	# call to have the medal judge and apply itself when valid to the users achievements.
	def judge(user, playedlevel)
		raise NotImplementedError.new("You must implement this on the derived type")
	end
end