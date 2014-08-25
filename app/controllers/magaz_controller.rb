class MagazController < ApplicationController
	def home
	end

	def categories
		@cats = Category.all
	end

	def products
		@cats = Product.all
	end

end