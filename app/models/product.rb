# encoding: utf-8
class Product < ActiveRecord::Base
	CATEGORY_OPTIONS = ['libros', 'música & películas', 'electrónica', 'hogar', 'juguetes', 'ropa', 'comestibles']

    validates :product_name, :added_at, :stock, :price, presence: true
	validates :stock, numericality: { only_integer: true}
	validates :price, numericality: { only_integer: false, greater_than:0}	
  	validates :category, :inclusion => {:in => CATEGORY_OPTIONS, :message => "must be one of the following: 'libros', 'música & películas', 'electrónica', 'hogar', 'juguetes', 'ropa', 'comestibles'"}
	validates :product_name, uniqueness: {case_sensitive: false, message: "- The product already exists" }    

	has_many :line_items
  	has_many :orders, through: :line_items

  	scope :search_by_category, ->(category) { where("category = ?", category) }
  	scope :search_by_stock, ->(stock) { where("stock = ?", stock) }
  	scope :search_by_date, ->(date1, date2) { where("added_at between ? and ?", date1, date2) }
  	scope :search_by_manufacturer, ->(manufacturer) { where("manufacturer like ?", "%#{manufacturer}%") }
  	scope :search_by_price, ->(price1, price2) { where("price between ? and ?", price1, price2) }

	def product_with_category
    	"#{product_name} - #{category}"
  	end
	
	def stock_movement(quantity)
		self.stock -= quantity
		update_column(:stock, self.stock)
	end
	
end
