class HomeController < MyAppController
	def index
		@products = Product.order(popular: :desc).limit(3)

		
	end
end