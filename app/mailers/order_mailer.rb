class OrderMailer < ActionMailer::Base
  default from: "alekseydanko@optimadata.co"

  def order_new_email(order)
  	@order = order
  	mail(to: 'maxis.thegenius@gmail.com', subject: 'New order')
  	
  end

  def user_order_email(order)
  	@order = order 
  	mail(to: @order.email, subject: 'Your order')

  end


end
