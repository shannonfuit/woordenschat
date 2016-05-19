class NoHintsMedal < LevelMedal

	def judge(user, playedlevel)
		# normally this should obviously only apply when the level numbers are equal.
		if(playedlevel.answers.where(used_semantic_hint: true).count == 0 &&
			playedlevel.answers.where(used_sentence_hint: true).count == 0 &&
			playedlevel.answers.where(used_image_hint: true).count == 0 && 
			playedlevel.level.number == self.level_number && !user.has_won(self)
			)
			achievement = Achievement.create({
							user_id: user, medal: self
						})
			user.achievements.push(achievement)
			return true
		end 
	end
end
