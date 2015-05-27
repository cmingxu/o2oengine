json.array!(@shipments) do |shipment|
  json.extract! shipment, :id, :address_id, :order_id, :user_id
  json.url shipment_url(shipment, format: :json)
end
