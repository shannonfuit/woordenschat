json.array!(@questions) do |question|
  json.extract! question, :id, :word, :ans1, :ans2, :ans3, :ans4, :hintsemantic, :hintsentence, :hintimage, :anscorrect, :level_id
  json.url question_url(question, format: :json)
end
