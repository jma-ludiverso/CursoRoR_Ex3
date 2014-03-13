class Product < ActiveRecord::Base

    validates :product_name, :manufacturer, :category, presence: true
	validates :product_name, uniqueness: { scope: :manufacturer, message: "- The product exists for the same manufacturer" }    
    validates :stock, presence: true
	validates :stock, numericality: { only_integer: true, greater_than:-1}

	validate :added_at_validation 

	def added_at_validation 
		errors.add(:added_at, "can't be a past date") if 
		!added_at.blank? and added_at < Date.today 
	end	
	
	has_many :line_items
  	has_many :orders, through: :line_items

end
