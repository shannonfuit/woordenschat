json.array!(@answers) do |answer|
  json.extract! answer, :id, :givenanswer, :answercorrect, :hintsemanticused, :hintsentenceused, :hintimageused, :xp, :questionstarted, :questionfinished, :playtime, :level, :question_id
  json.url answer_url(answer, format: :json)
end
