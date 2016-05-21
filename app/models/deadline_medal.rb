# medal if you play before the level deadline
class DeadlineMedal < LevelMedal
  def judge(user, played_level)
    if played_level.ended_at < played_level.level.closingdate &&
       played_level.level.number == level_number &&
       !user.won?(self)
      user.achievements.create medal: self
    end
  end
end
