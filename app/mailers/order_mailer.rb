class OrderMailer < ActionMailer::Base
  default from: "info@cursorails.com"

	def new_order_email(order,user)
	   @user = user
	   @order = order
	   @url  = 'http://cursorails.com'
	   mail(to: @user.email)
	end  

end
