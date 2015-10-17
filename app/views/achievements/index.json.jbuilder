json.array!(@achievements) do |achievement|
  json.extract! achievement, :id, :name, :description, :hashtags, :status
  json.url achievement_url(achievement, format: :json)
end
