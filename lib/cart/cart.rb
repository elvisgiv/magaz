class Cart::Cart #Cart::Cart мы пишем, потому что назвали папку Cart (которая является модулем) и файл cart.rb, который является классом. двоеточие означает принадлежность к модулю.

attr_accessor :items

  def items #мы пишем метод items, птому что в cart_contoller.rb мы записали строку @items = @cart.items, в которой присваиваем метод items @cart'у.

    @items ||= [] #если в итемсах до этого лежал nil

    return @items #return - возвращает значение из этого метода (def items)

  end

  def add(product, q) # метод add с параметрами product и q. 

     items << {:name => product.name, :price => product.price, :quantity => q}

  end


end