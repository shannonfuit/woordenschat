class AllMedalsMedal < Medal

	def judge(user, playedlevel = nil)
		if Medal.count - user.medals.count == 1
			user.achievements.create user: user, medal: self
		end
	end
end