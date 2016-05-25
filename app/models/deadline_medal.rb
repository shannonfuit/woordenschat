# medal if you play before the level deadline
class DeadlineMedal < LevelMedal
  def judge(user, round)
    if round.ended_at < round.level.closed_at &&
       round.level.number == level_number &&
       !user.won?(self)
      user.achievements.create medal: self
    end
  end
end
