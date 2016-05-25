# medal if you won three starts in a level
class ThreeStarMedal < LevelMedal
  def judge(user, round)
    return unless round.stars == 3 &&
                  round.level.number == level_number &&
                  !user.won?(self)
    user.achievements.create medal: self
  end
end
