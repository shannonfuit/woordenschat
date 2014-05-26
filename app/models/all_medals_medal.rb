class AllMedalsMedal < Medal

	def judge(user, playedlevel)
		number_of_medals = Medal.count
		number_of_achieved_medals = user.achievements.count
		if ((number_of_medals - number_of_achieved_medals) == 1)
			achievement = Achievement.create({
							user_id: user, medal: self
						})
			user.achievements.push(achievement)
			return true
		end 
	end
end