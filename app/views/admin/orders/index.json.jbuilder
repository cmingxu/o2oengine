json.array!(@orders) do |order|
  json.extract! order, :id, :total_price, :order_status, :ship_status, :payment_status
  json.url order_url(order, format: :json)
end
