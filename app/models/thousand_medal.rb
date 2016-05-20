class ThousandMedal < WordsMedal
  def judge(user, _played_level)
    count_correct = user.answers.all.select(&:correct_answered?).size
    return false if user.has_won(self) || count_correct < 1000
    user.achievements.create(user: user, medal: self)
  end
end
