class TwentyFiveInRowMedal < WordsMedal
  def judge(user, _playedlevel = nil)
    count_correct = user.answers.last(25).collect(&:correct_answered?).length
    return false if user.has_won self || count_correct < 25
    user.achievements.create(user: user, medal: self)
  end
end
