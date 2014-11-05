class Product < ActiveRecord::Base
	paginates_per 2
	belongs_to :category
	has_many :cart_items
	has_one :warehouse
	accepts_nested_attributes_for :warehouse,  :allow_destroy => true

	def add_view_count(session)

		session[:products_viewed] = [] if session[:products_viewed].nil?

		unless session[:products_viewed].include? self.id

			session[:products_viewed] = session[:products_viewed] | [self.id] # оператор | складывает два массива убирая дубликаты
			
			self.popular += 1

			save
		end
	end

	def warehouse_count #метод возвращает ноль, если объект склада отсутствует (сама строка) или отсутствует количество в этой строке. и возвращает количество в другом случае

		return 0 if self.warehouse.nil?

		return 0 if self.warehouse.quantity.nil? || self.warehouse.quantity <= 0

		return self.warehouse.quantity

	end





end
