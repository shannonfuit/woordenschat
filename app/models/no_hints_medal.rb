class NoHintsMedal < LevelMedal
  def judge(user, played_level)
    answers = playedlevel.answers
    return unless answers.find_by(used_semantic_hint: true) &&
                  answers.find_by(used_sentence_hint: true) &&
                  answers.find_by(used_image_hint: true) &&
                  played_level.level.number == level_number &&
                  !user.has_won(self)
    user.achievements.create(user: user, medal: self)
  end
end
