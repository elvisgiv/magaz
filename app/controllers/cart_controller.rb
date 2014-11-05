class CartController < MyAppController
	
	def show
		
		@cart_id = session[:cart_id]
		if @cart_id.nil? 
			render :show_empty and return	 		 		
	 	end

		@items = @cart.cart_items.includes(:product)
		#@items = CartItem.includes(:product).where(cart_id: @cart_id)

		#@gtotal = 
=begin
		return
		@cart = Cart::Cart.create_from_session(session)
		#@cart = Marshal.load(session[:cart])
		#@cart = session[:cart] #чтобы переменная была видна во views перед ней ставим @
		logger.info "xxxxxxx#{@cart.inspect}"
		#@cart = Cart::Cart.new #Cart::Cart.new вместо Cart.new, потому что создали в папке lib папку Cart с файлом Cart.rb, в котором указали класс class Cart:Cart
		#@cart.add(Product.find(1), 5)
		#@cart.add(Product.find(2), 4)
		#@cart.add(Product.find(3), 2)
		@items = @cart.items #метод .items мы взяли из F:\projects\magaz\lib\cart\cart.rb
		@gtotal = @cart.total #metod total вызвали для объекта корзина из класса Cart::Cart

=end
	end

	def add
		if !session.has_key? :cart_id #! - означает "если нет" Если в сессии нет ключа cart_id, то создаем Cart.new, если есть, то используем Session(:cart_id)
	# session, как и .has_key? является сложной хуйней по-умолчанию, с ней можно работать как с хэшем
	    logger.debug "VSE GAVNO"
	     	b = Cart.new
			#b.created = Time.now.utc.to_i
			b.save
			session[:cart_id] = b.id #сохранили id созданного объекта класса Cart 'b' в сессии.
			@cart = b
	    	else
	    logger.debug "NET NE VSE GAVNO"
	    	s = session[:cart_id].to_i
			
		logger.debug "A YA GOVORY VSE GAVNO"
			b = Cart.find_by_id(s)
			@cart = b
	    end

	    	id = params[:id].to_i

			if id <=0 || id.nil?
				render :add_empty and return
			end

			q = params[:q].to_i

			if q <=0 || q.nil?
				render :add_empty and return
			end
		
		product_id = params[:id]

#logger.debug "--get old--"
		
		@items = @cart.cart_items.where(product_id: product_id)
		#@items = CartItem.where(product_id: product_id)
		
#logger.debug "--res = #{@items.inspect}"

		if @items.empty?

			p = Product.find(params[:id]) #находит в базе продукт с соответствующим айдишником
			c = CartItem.new
			#logger.debug "#{p.price}"
			c.price = p.price #взяли цену у продукта и отдали в строку корзины
			c.quantity = params[:q]
			#c.total = c.price*c.quantity
			c.product_id = params[:id]
			c.cart_id = b.id
			c.save #команда для сохранения в базу данных
			redirect_to addcartresult_path
					
		else
			p = Product.find(params[:id]) #находит в базе продукт с соответствующим айдишником
			c = @items[0]
			#logger.debug "#{p.price}"
			#c.price = p.price #взяли цену у продукта и отдали в строку корзины
			c.quantity = c.quantity + params[:q].to_i
			#c.total = c.price*c.quantity
			#c.product_id = params[:id]
			#c.cart_id = b.id
			c.save #команда для сохранения в базу данных
			redirect_to addcartresult_path
		end

=begin
		это сделано для сессии
		@cart = Cart::Cart.create_from_session(session)
		#@cart = Marshal.load(session[:cart])#забираем карт из сессии, в сессии он лежит в херовом формате Marshal.load(session[:cart]) делает нормальный формат объекта
		p = Product.find(params[:id])
	
		@cart.add(p, params[:q]) #обращаемся к классу Product, который находится в модели F:\projects\magaz\app\models\product.rb
		
		Cart::Cart.save_to_session(session, @cart)
		redirect_to addcartresult_path #перенаправляем пользователя со страницы с запросом POST на страницу с запросом GET для юзерфрендли
=end
		
	
	end		

	def addresult

	end

	def delete
		if @cart_id.nil?#из application controllera из метода def set_cart
		redirect_to root_path 
		return
		end

		product_id = params[:product_id]
		#@cart = Cart::Cart.create_from_session(session)
		#@cart.items = []
		#CartItem.destroy_all(:product_id => product_id) #удаляет записи по айдишнику со ВСЕХ корзин!!! что есть не правильно
		#CartItem.destroy_all(:product_id => product_id, :cart_id => @cart_id) #удаляет только продукты данной корзины
		@cart.cart_items.where(:product_id => product_id).delete_all#делает тоже, что и предыдущий код/ @cart.cart_items смотри файл аппликешен_контроллер
		#Cart::Cart.save_to_session(session, @cart)
    	
    	flash[:success] = "Product deleted."
    	
		redirect_to cart_path
	end

	def update 
		q = params[:q]
		id = params[:id]
		#item = CartItem.find(id)#нашли по айдишнику, который пришел из вьюхи из форм_тега = hidden_field_tag 'id', t.id
		item = @cart.cart_items.find(id)#делает тоже, что и предыдущий код/ @cart.cart_items смотри файл аппликешен_контроллер
		item.quantity = q
		
		if !item.save
			flash[:error] = "Bad quantity"
			redirect_to cart_path
			return
		end

		flash[:success] = "Updated"
		redirect_to cart_path
	end

	def new
		@item = Item.new
	end




	 # if @product.update(product_params)
	  #	redirect_to(@product)
	  #else
	  #	render "products"
	  #end

		#redirect_to product_path(id: 1) and return if @product.empty?


 	 
end