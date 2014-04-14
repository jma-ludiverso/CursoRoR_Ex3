class Order < ActiveRecord::Base
	STATUS_OPTIONS = %w(Pendiente Enviado Recibido)
	PAYMENT_OPTIONS = %w(efectivo tarjeta paypal)

    validates :customer_name, :customer_surname, :delivery_address, :delivery_city, :payment_method, :order_status, presence: true
  	validates :order_status, :inclusion => {:in => STATUS_OPTIONS, :message => "must be one of the following: 'Pendiente' 'Enviado' 'Recibido'"}    
  	validates :payment_method, :inclusion => {:in => PAYMENT_OPTIONS, :message => "must be one of the following: 'efectivo' 'tarjeta' 'paypal'"}    

  	has_many :line_items, :dependent => :destroy
  	has_many :products, through: :line_items

	accepts_nested_attributes_for :line_items, reject_if: :all_blank, :allow_destroy => true
	
	before_validation :autocomplete_orderstatus, on: :create

	def get_total_price
		line_items.sum {|l| l.price * l.quantity}
	end

	protected
	def autocomplete_orderstatus
		self.order_status = "Pendiente"
	end

end
