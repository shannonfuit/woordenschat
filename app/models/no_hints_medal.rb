class NoHintsMedal < LevelMedal

	def judge(user, playedlevel)
		# normally this should obviously only apply when the level numbers are equal.
		if(playedlevel.answers.where(hintsemanticused: true).count == 0 && 
			playedlevel.answers.where(hintsemanticused: true).count == 0 &&
			playedlevel.answers.where(hintsemanticused: true).count == 0 &&
			playedlevel.level.number == self.levelnumber && !user.haswon(self)
			)
			achievement = Achievement.create({
							user_id: user, medal: self
						})
			user.achievements.push(achievement)
			return true
		end 
	end
end
