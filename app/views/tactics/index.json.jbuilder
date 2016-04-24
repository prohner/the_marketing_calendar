json.array!(@tactics) do |tactic|
  json.extract! tactic, :id
  json.url tactic_url(tactic, format: :json)
end
