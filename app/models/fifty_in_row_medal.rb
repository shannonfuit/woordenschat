class FiftyInRowMedal < WordsMedal
  def judge(user, _played_level = nil)
    count_correct = user.answers.last(50).select(&:correct_answered?).size
    return false if user.won?(self) || count_correct < 50
    user.achievements.create medal: self
  end
end
