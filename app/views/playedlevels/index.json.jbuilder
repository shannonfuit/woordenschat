json.array!(@playedlevels) do |playedlevel|
  json.extract! playedlevel, :id, :startlevel, :ended_at, :seconds, :levelcompleted, :stars, :level_id, :user_id, :correctquestions, :levelxp
  json.url playedlevel_url(playedlevel, format: :json)
end
