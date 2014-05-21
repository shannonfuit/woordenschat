json.array!(@achievements) do |achievement|
  json.extract! achievement, :id, :user_id, :medal_id
  json.url achievement_url(achievement, format: :json)
end
