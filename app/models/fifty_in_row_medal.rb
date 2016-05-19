class FiftyInRowMedal < WordsMedal
  def judge(user, _playedlevel = nil)
    count_correct = user.answers.last(50).collect(&:correct_answered?).length
    return false if user.has_won self || count_correct < 50
    user.achievements.create(user: user, medal: self)
  end
end
