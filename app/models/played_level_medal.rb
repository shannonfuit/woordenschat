class PlayedLevelMedal < LevelMedal

	def judge(user, playedlevel)
		# normally this should obviously only apply when the level numbers are equal.
		if(playedlevel.levelcompleted? && playedlevel.level.number == self.levelnumber && !user.haswon(self)
			)
			achievement = Achievement.create({
							user_id: user, medal: self
						})
			user.achievements.push(achievement)
		end 
	end
end