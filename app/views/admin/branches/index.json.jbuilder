json.array!(@branches) do |branch|
  json.extract! branch, :id, :name, :address, :contact, :lng, :lat
  json.url branch_url(branch, format: :json)
end
