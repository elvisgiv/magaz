class ProductsController < ApplicationController
	
	def show
	  @id = params[:id].to_i
	  @product = Product.find_by_id(@id)
		
		if @product.nil? 
			render :error and return	 		 		
	 	end
	 		 	

	 # if @product.update(product_params)
	  #	redirect_to(@product)
	  #else
	  #	render "products"
	  #end

		#redirect_to product_path(id: 1) and return if @product.empty?


 	 end
end