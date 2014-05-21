class DeadlineMedal < LevelMedal

	def judge(user, playedlevel)
		if(playedlevel.finishlevel < playedlevel.level.closingdate && playedlevel.level.number == self.levelnumber && !user.haswon(self)
			)
			achievement = Achievement.create({
							user_id: user, medal: self
						})
			user.achievements.push(achievement)
		end 
	end
end