json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :sku, :desc, :quantity, :pic1, :pic2, :pic3, :pic4
  json.url product_url(product, format: :json)
end
