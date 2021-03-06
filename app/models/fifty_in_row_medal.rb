# medal if you have 50 good answers in a row
class FiftyInRowMedal < WordsMedal
  def judge(user, _round = nil)
    count_correct = user.answers.last(50).select(&:correct_answered?).size
    return false if user.won?(self) || count_correct < 50
    user.achievements.create medal: self
  end
end
