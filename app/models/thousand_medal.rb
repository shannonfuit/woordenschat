class ThousandMedal < WordsMedal
  def judge(user, _playedlevel)
    count_correct = user.answers.all.collect(&:correct_answered?).length
    return false if user.has_won self || count_correct < 1000
    user.achievements.create(user: user, medal: self)
  end
end
