# medal if you have 25 good answers in a row
class TwentyFiveInRowMedal < WordsMedal
  def judge(user, _round = nil)
    count_correct = user.answers.last(25).select(&:correct_answered?).size
    return false if user.won?(self) || count_correct < 25
    user.achievements.create medal: self
  end
end
