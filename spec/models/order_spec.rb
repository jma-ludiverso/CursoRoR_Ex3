require 'spec_helper'

describe Order do
  
	it "order status" do
		order = Order.create!(payment_method: "paypal", delivery_address: "test address", delivery_city: "madrid", customer_name: "test customer", customer_surname: "test surname")
		expect(order.order_status).to eq("Pendiente")
	end

end
