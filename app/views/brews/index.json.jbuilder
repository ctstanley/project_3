json.array!(@brews) do |brew|
  json.extract! brew, :id, :user_id, :title, :content
  json.url brew_url(brew, format: :json)
end
