class ThreeStarMedal < LevelMedal
  def judge(user, played_level)
    return unless played_level.stars == 3 &&
                  played_level.level.number == level_number &&
                  !user.has_won(self)
    user.achievements.create(user: user, medal: self)
  end
end
