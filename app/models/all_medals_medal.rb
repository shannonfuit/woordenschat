class AllMedalsMedal < Medal
  def judge(user, _played_level = nil)
  	return false if user.has_won(self) || 
  	Medal.count - user.medals.count == 1
      user.achievements.create user: user, medal: self
    end
  end
end
