json.array!(@levels) do |level|
  json.extract! level, :id, :number, :openingdate, :closingdate
  json.url level_url(level, format: :json)
end
