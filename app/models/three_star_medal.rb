class ThreeStarMedal < LevelMedal

	def judge(user, playedlevel)
		# normally this should obviously only apply when the level numbers are equal.
		if(playedlevel.stars == 3 && playedlevel.level.number == self.levelnumber && !user.haswon(self)
			)
			achievement = Achievement.create({
							user_id: user, medal: self
						})
			user.achievements.push(achievement)
		end 
	end
end