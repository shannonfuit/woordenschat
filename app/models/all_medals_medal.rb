class AllMedalsMedal < Medal
  def judge(user, _played_level = nil)
    return if user.won?(self) || Medal.count - user.medals.count != 1
    user.achievements.create medal: self
  end
end
