# medal if you have 100 good answers
class HundredMedal < WordsMedal
  # 100 answers in a row correct
  def judge(user, _played_level = nil)
    count_correct = user.answers.select(&:correct_answered?).size
    return false if user.won?(self) || count_correct < 100
    user.achievements.create medal: self
  end
end
