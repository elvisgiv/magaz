class CartLib::CartLib #Cart::Cart мы пишем, потому что назвали папку Cart (которая является модулем) и файл cart.rb, который является классом. двоеточие означает принадлежность к модулю.

attr_accessor :items

  def items #мы пишем метод items, птому что в cart_contoller.rb мы записали строку @items = @cart.items, в которой присваиваем метод items @cart'у.

    @items ||= [] #если в итемсах до этого лежал nil

    return @items #return - возвращает значение из этого метода (def items)

  end

  def add(product, q) # метод add с параметрами product и q. 
    q = q.to_i
    d = items.index{|x| x[:id]==product.id.to_i}#порядковый номер хеша, в котором мы ищем определенный продукт с определенным id
    if d.nil?
      items << {:id => product.id, :name => product.name, :price => product.price, :quantity => q}
    else
      items[d][:quantity] += q

    end
  end
  
  def total # считаем общую цену за товары
    w = items.inject(0){|sum,x| sum + x[:price]*x[:quantity]*discount_product(x[:id])}#ingect проходится по массиву и суммирует элементы хэшей
    w = w*discount

  end

  def discount # скидки на товары в зависимости от дня недели
    t = Date.today
    if t.monday?
         0.85
      elsif t.tuesday?
        0.7
      elsif t.wednesday?
        0.9
      elsif t.thursday?
        0.8
      elsif t.fridy?
        0.5
      elsif t.saturday?
        0.6
      else
        1
      end       
         
  end

  def discount_array # метод, который возвращает все текущие скидки
  


  skidki = {1 => 0.5, 3 => 0.8} #присвоил переменной skidki хэш, в котором числа соответствуют числам, для того, чтобы удобно узнавать скидку по id продуктов
#skidki[1]
  end

  def discount_product(id) # метод, который возвращает скидку для текущего продукта
    
    discount_array.has_key?(id) ?  discount_array[id] : 1 # есть ли такой айди у хеша, если есть, то скидка работает, если нет, то приравниваем к единице


  end

  def number # количество товаров в корзине
    items.count
  
  end





  def initialize
    @items = [] #если в итемсах до этого лежал nil

  end

  def self.create_from_session(s) #self - это метод класса, без self-обычный метод
       if !s.has_key? :cart

      f = Cart::Cart.new

    else
    f = Marshal.load(s[:cart])

    end
  end

  def self.save_to_session(s, cart)
        s[:cart] = Marshal.dump(cart)


  end




  def delete (id)
    #id = id.to_i
    logger = Rails.logger
    logger.info "id=#{id}"
    #@items = []
    logger.debug "#{@items.inspect}"
    @items.delete_if{|x| x[:id] == id}
    logger.debug "#{@items.inspect}"


  end




end