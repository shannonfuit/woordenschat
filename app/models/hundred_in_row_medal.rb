class HundredInRowMedal < WordsMedal
  def judge(user, _playedlevel = nil)
    count_correct = user.answers.last(100).collect(&:correct_answered?).length
    return false if user.has_won self || count_correct < 100
    user.achievements.create(user: user, medal: self)
    end
end
