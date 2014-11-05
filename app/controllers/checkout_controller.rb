class CheckoutController < MyAppController

	def address #new
		@order = Order.new
		if @cart.nil?
			redirect_to cart_path and return
		end

	end


	def update #create
		@order = Order.new(order_params)
		@order.total = @gtotal #@gtotal забираем из my_app_controller


		if @order.save
			@cart.cart_items.each do |ci| #@cart забираем из my_app_controller
				ci.order = @order
				ci.save
			end
			session.delete(:cart_id)
			OrderMailer.order_new_email(@order).deliver #отсылаем почту админу
			OrderMailer.user_order_email(@order).deliver #отсылаем почту юзеру


			redirect_to checkout_thankyou_path and return
		end
		render :address
	end

private

    def order_params
      params.require(:order).permit(:name, :email, :phone, :shipping_method_id)
    end


	



	
end
