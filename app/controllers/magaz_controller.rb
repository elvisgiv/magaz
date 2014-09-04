class MagazController < ApplicationController
	
	def home
	end

	def categories
		@cats = Category.all
	end

	def products

		@pg = params[:page].to_i

		@pg = 1 if @pg <= 0



		@prd = Product.includes(:category).page(params[:page])
	 
	 

redirect_to magaz_products_path(page: 1) and return if @prd.empty? 

		#Product.popular = products.popular + 1
		#Product.update_attributes(:popular)
	end

	def cart

	end



	

end