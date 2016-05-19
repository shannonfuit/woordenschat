class HundredMedal < WordsMedal
  # 100 answers in a row correct

  def judge(user, _playedlevel = nil)
    number_correct = user.answers.all.collect(&:correct_answered?).length
    return false if user.has_won self || number_correct < 100
    user.achievements.create(user: user, medal: self)
  end
end
