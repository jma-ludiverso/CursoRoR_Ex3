json.array!(@orders) do |order|
  json.extract! order, :id, :order_status, :payment_method, :delivery_address, :delivery_city, :customer_name, :customer_surname
  json.url order_url(order, format: :json)
end
