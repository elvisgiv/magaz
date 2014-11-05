class CartItem < ActiveRecord::Base
  belongs_to  :cart
  belongs_to  :product
  belongs_to  :order
  before_save :my_before_save
  validates   :quantity, presence: true, numericality: {greater_than: 0} # валидация на уровне модели, чтобы контроллер не подставлял что попало в значения
 

  def my_before_save
  	self.total = self.price*self.quantity
  end
  
end