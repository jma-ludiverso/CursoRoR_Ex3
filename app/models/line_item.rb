class LineItem < ActiveRecord::Base

    validates :product_id, :quantity, :price, presence: true
    validates :quantity, numericality: { only_integer: true, greater_than:0}
    validates :price, numericality: { only_integer: false, greater_than:0}

	belongs_to :order
	belongs_to :product

	before_validation :autocomplete_price
	after_create :stock_movement

	protected
	def autocomplete_price
		self.price = product.price
	end

	def stock_movement
		product.stock_movement(quantity)
	end

end
