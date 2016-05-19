class ThousandMedal < WordsMedal

	def judge(user, playedlevel)
		if(!user.has_won(self))
			number_of_correct_answers = 0
			answers = user.answers.order("id asc")
			answers.each do |answer|
				if answer.correct_answered?
					number_of_correct_answers += 1
					if number_of_correct_answers == 1000
						achievement = Achievement.create({
										user_id: user, medal: self
									})
						user.achievements.push(achievement)
						return true
					end
				end
			end
		end 
	end
end