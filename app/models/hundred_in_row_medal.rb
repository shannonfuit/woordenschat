# medal if you have 100 good answers in a row
class HundredInRowMedal < WordsMedal
  def judge(user, _round = nil)
    count_correct = user.answers.last(100).select(&:correct_answered?).size
    return false if user.won?(self) || count_correct < 100
    user.achievements.create medal: self
  end
end
