class Order < ActiveRecord::Base

	STATUS_OPTIONS = %w(Pre-Order Order Delivered)
	PAYMENT_OPTIONS = %w(Credit-Card Transference)

    validates :order_status, :payment_method, :delivery_address, :delivery_city, :customer_name, :customer_surname, presence: true
  	validates :order_status, :inclusion => {:in => STATUS_OPTIONS, :message => "must be one of the following: 'Pre-Order' 'Order' 'Delivered'"}    
  	validates :payment_method, :inclusion => {:in => PAYMENT_OPTIONS, :message => "must be one of the following: 'Credit-Card' 'Transference'"}    

  	has_many :line_items
  	has_many :products, through: :line_items

end
