json.array!(@addresses) do |address|
  json.extract! address, :id, :user_id, :name, :provice, :city, :detail_address, :postal_code, :phone
  json.url address_url(address, format: :json)
end
