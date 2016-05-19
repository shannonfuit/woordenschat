class DeadlineMedal < LevelMedal
  def judge(user, played_level)
    if played_level.ended_at < played_level.level.closingdate &&
       played_level.level.number == level_number &&
       !user.has_won(self)
      user.achievements.create user: user, medal: self
    end
  end
end
