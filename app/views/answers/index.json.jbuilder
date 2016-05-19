json.array!(@answers) do |answer|
  json.extract! answer, :id, :given_answer, :correct_answered, :used_semantic_hint, :used_sentence_hint, :used_image_hint, :xp, :created_at, :seconds, :level, :question_id
  json.url answer_url(answer, format: :json)
end
