class ProductsController < MyAppController
	
	def show
	  @id = params[:id].to_i
	  @product = Product.find_by_id(@id)
	  @product_warehouse = @product.warehouse #метод warehouse появился из-за того, что мы связали таблицы Product и Warehouse

		
		if @product.nil? 
			render :error and return	 		 		
	 	end

	 # if @product.update(product_params)
	  #	redirect_to(@product)
	  #else
	  #	render "products"
	  #end

		#redirect_to product_path(id: 1) and return if @product.empty?

		@product.add_view_count(session)

 	 end

 	def index

 		@pg = params[:page].to_i

		@pg = 1 if @pg <= 0

		@prd = Product.includes(:category, :warehouse).page(params[:page])

		redirect_to products_path(page: 1) and return if @prd.empty? 

		
	end


end