class HundredMedal < WordsMedal
  # 100 answers in a row correct
  def judge(user, _played_level = nil)
    count_correct = user.answers.select(&:correct_answered?).size
    return false if user.has_won(self) || count_correct < 100
    user.achievements.create(user: user, medal: self)
  end
end
