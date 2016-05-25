# medal if you used no hints in a level
class NoHintsMedal < LevelMedal
  def judge(user, round)
    answers = round.answers
    return unless answers.find_by(used_semantic_hint: true) &&
                  answers.find_by(used_sentence_hint: true) &&
                  answers.find_by(used_image_hint: true) &&
                  round.level.number == level_number &&
                  !user.won?(self)
    user.achievements.create medal: self
  end
end
