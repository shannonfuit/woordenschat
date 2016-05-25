# medal if you have 100 good answers
class ThousandMedal < WordsMedal
  def judge(user, _round)
    count_correct = user.answers.all.select(&:correct_answered?).size
    return false if user.won?(self) || count_correct < 1000
    user.achievements.create medal: self
  end
end
