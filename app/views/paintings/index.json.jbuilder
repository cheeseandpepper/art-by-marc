json.array!(@paintings) do |painting|
  json.extract! painting, :id
  json.url painting_url(painting, format: :json)
end
