# encoding: utf-8
class Product < ActiveRecord::Base
	CATEGORY_OPTIONS = ['libros', 'música & películas', 'electrónica', 'hogar', 'juguetes', 'ropa', 'comestibles']

    validates :product_name, :added_at, :stock, :price, presence: true
	validates :stock, numericality: { only_integer: true}
	validates :price, numericality: { only_integer: false, greater_than:0}	
  	validates :category, :inclusion => {:in => CATEGORY_OPTIONS, :message => "must be one of the following: 'libros', 'música & películas', 'electrónica', 'hogar', 'juguetes', 'ropa', 'comestibles'"}
	validates :product_name, uniqueness: {case_sensitive: false }    

	has_many :line_items
  	has_many :orders, through: :line_items

  	scope :search_by_category, lambda{ |category| where("category = ?", category) if category.present? }  
  	scope :search_by_stock, lambda{ |stock| where("stock = ?", stock) if stock.present? }
  	scope :search_by_date, lambda{ |date1, date2| where(added_at:[date1...date2]) if date1.present? && date2.present? }
  	scope :search_by_manufacturer, lambda{ |manufacturer| where("manufacturer like ?", "%#{manufacturer}%") if manufacturer.present?}
  	scope :search_by_price, lambda{ |price1, price2| where(price:[price1...price2]) if price1.present? && price2.present? }

	def product_with_category
    	"#{product_name} - #{category}"
  	end
	
	def stock_movement(quantity)
		self.stock -= quantity
		update_column(:stock, self.stock)
	end
	
	def self.product_filters(params)
	    products = all
	    products = products.search_by_category(params[:category]).
	    search_by_stock(params[:stock]).
	    search_by_date(params[:date1],params[:date2]).
	    search_by_manufacturer(params[:manufacturer]).
	    search_by_price(params[:price1],params[:price2]) 		
	end 

end
