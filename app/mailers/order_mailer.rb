class OrderMailer < ActionMailer::Base
  default from: "system@example.com"

  def order_new_email(order)
  	@order = order
  	mail(to: 'admin@example.com', subject: 'New order')
  	
  end

  def user_order_email(order)
  	@order = order 
  	mail(to: @order.email, subject: 'Your order')

  end


end
