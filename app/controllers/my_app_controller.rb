class MyAppController < ActionController::Base
 
 	before_filter :set_cart #этот метод будет вызываться перед всеми контроллерами

  layout "application"#написали, для того, чтобы находило файл application.html.erb, а не искало майаппликешен

  def set_cart
  	#return
  	@cart_id = session[:cart_id]
    

  	unless @cart_id.nil?
     @cart = Cart.find(@cart_id) # мы присваиваем переменной @cart объект класса Cart через использование метода .find
  	 #a = CartItem.where(:cart_id => @cart_id).sum("total")
  	 @cart_t = CartItem.where(:cart_id => @cart_id).sum("total")#этот код не руби стайл
  	 @cart_n = @cart.cart_items.sum("quantity")# этот код руби стайл. мы заменили CartItem.where(:cart_id => @cart_id) на @cart.cart_items берем для объекта @cart метод .cart_items, потому что у нас есть связь между карт и карт итемс как хэз мэни и билонгс ту
     @gtotal = CartItem.where(:cart_id => @cart_id).sum("total")
	  end
  end






end
