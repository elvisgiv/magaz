class CartController < ApplicationController
	
	def show
		@cart = Marshal.load(session[:cart])
		#@cart = session[:cart] #чтобы переменная была видна во views перед ней ставим @
		logger.info "xxxxxxx#{@cart.inspect}"
		#@cart = Cart::Cart.new #Cart:Cart.new вместо Cart.new, потому что создали в папке lib папку Cart с файлом Cart.rb, в котором указали класс class Cart:Cart
		#@cart.add(Product.find(1), 5)
		#@cart.add(Product.find(2), 4)
		#@cart.add(Product.find(3), 2)
		@items = @cart.items #метод .items мы взяли из F:\projects\magaz\lib\cart\cart.rb
	
	end

	def add
		
		@cart = Marshal.load(session[:cart])#забираем карт из сессии, в сессии он лежит в херовом формате Marshal.load(session[:cart]) делает нормальный формат объекта

		@cart.add(Product.find(params[:id]), params[:q]) #обращаемся к классу Product, который находится в модели F:\projects\magaz\app\models\product.rb
		
		session[:cart] = Marshal.dump(@cart)

		redirect_to addcartresult_path #перенаправляем пользователя со страницы с запросом POST на страницу с запросом GET для юзерфрендли
	
	end		

	def addresult


	end



	 # if @product.update(product_params)
	  #	redirect_to(@product)
	  #else
	  #	render "products"
	  #end

		#redirect_to product_path(id: 1) and return if @product.empty?


 	 
end