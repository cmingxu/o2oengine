json.array!(@provices) do |provice|
  json.extract! provice, :id, :name
  json.url provice_url(provice, format: :json)
end
