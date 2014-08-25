class MagazController < ApplicationController
	def home
	end

	def categories
		@cats = Category.all
	end

	def products
		@prd = Product.all
	end

	

end