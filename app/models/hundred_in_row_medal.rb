class HundredInRowMedal < WordsMedal
  def judge(user, _played_level = nil)
    count_correct = user.answers.last(100).select(&:correct_answered?).size
    return false if user.has_won(self) || count_correct < 100
    user.achievements.create(user: user, medal: self)
  end
end
