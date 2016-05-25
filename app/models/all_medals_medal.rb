# medal if you win all the other medals
class AllMedalsMedal < Medal
  def judge(user, _round = nil)
    return if user.won?(self) || Medal.count - user.medals.count != 1
    user.achievements.create medal: self
  end
end
