class TwentyFiveInRowMedal < WordsMedal
  def judge(user, _played_level = nil)
    count_correct = user.answers.last(25).select(&:correct_answered?).size
    return false if user.won?(self) || count_correct < 25
    user.achievements.create medal: self
  end
end
