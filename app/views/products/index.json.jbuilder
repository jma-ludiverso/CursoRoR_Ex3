json.array!(@products) do |product|
  json.extract! product, :id, :product_name, :description, :category, :added_at, :manufacturer, :stock, :price
  json.url product_url(product, format: :json)
end
