class Order < ActiveRecord::Base
	has_many   :cart_items 
	belongs_to :order_payment_status
	belongs_to :order_status
	belongs_to :shipping_method
	validates  :email, :phone, :name, :shipping_method_id, presence: true
	before_validation(on: :create) do 
		
		self.order_number = "R" + (0..9).to_a.shuffle[0..5].join
		
		name = OrderStatus.find_by name: 'new' #лезет в таблицу order_statuses и вытаскивает из нее айдишник по ключу name: 'new'
			self.order_status_id = name.id

		name = OrderPaymentStatus.find_by name: 'unpaid'
			self.order_payment_status_id = name.id

		self.order_date = Time.now

	end

	def set_paid!
		@name = OrderPaymentStatus.find_by name: 'paid'
		if self.order_payment_status.name == 'unpaid' #лезет в таблицу order_payment_statuses и вытаскивает из нее имя по айдишнику и сравнивает с надписью 'unpaid'
			self.order_payment_status_id = @name.id
			save
			
		end


		#@order = Order.find(params[:id])




	end





end
