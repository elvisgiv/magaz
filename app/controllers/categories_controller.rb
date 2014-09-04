class CategoriesController < ApplicationController
	
	def show
	  @id = params[:id]	# category id from the URL in 'magaz/categories/:id' == :id in the URL

	  @category = Category.find(@id) # get category from DB by ID

	  @prd = Product.where("category_id = ?", @id).order(price: :asc)


		@sort = params[:sort]

		p = Product.where("category_id = ?", @id)

		if  @sort == 'price_min'
			@prd = p.order(price: :asc)
		elsif  @sort == 'price_max'
			@prd = p.order(price: :desc)
		elsif  @sort == 'name1'
			@prd = p.order(name: :asc)
		elsif  @sort == 'name2'
			@prd = p.order(name: :desc)
		elsif  @sort == 'popular1'
			@prd = p.order(popular: :asc)
		elsif  @sort == 'popular2'
			@prd = p.order(popular: :desc)

		end

  	

	end


end

