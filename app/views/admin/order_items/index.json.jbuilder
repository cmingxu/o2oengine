json.array!(@order_items) do |order_item|
  json.extract! order_item, :id, :order_id, :product_id, :quantity, :price
  json.url order_item_url(order_item, format: :json)
end
