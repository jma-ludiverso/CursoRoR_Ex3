require 'spec_helper'

describe Product do
  
	before :each do
		@product = Product.create!(product_name: "Everything you ever wanted to know about rails", added_at: Time.current, price: 20, stock: 15, category: "libros")
	end

	it "stock decrement" do		
		expect {@product.stock_movement(5)}.to change { @product.stock }.by(-5)
	end

	it "dropdown description" do
		expect(@product.product_with_category).to eq("#{@product.product_name} - #{@product.category}")
	end	

end
