class CategoriesController < ApplicationController
	
	def show
	  @id = params[:id]	# category id from the URL in 'magaz/categories/:id' == :id in the URL

	  @category = Category.find(@id) # get category from DB by ID

	  @prd = Product.where("category_id = ?", @id)


	end


end

