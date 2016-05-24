json.array!(@played_levels) do |played_level|
  json.extract! played_level, :id, :started_at, :ended_at, :seconds, :stars, :level_id, :user_id, :count_correct, :level_xp
  json.url played_level_url(played_level, format: :json)
end
