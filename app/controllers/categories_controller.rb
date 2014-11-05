class CategoriesController < MyAppController
	
	def show
	  @id = params[:id]	# category id from the URL in 'magaz/categories/:id' == :id in the URL

	  @category = Category.find(@id) # get category from DB by ID

	  @children = @category.children

	  @prd = Product.where("category_id = ?", @category.id).order(price: :asc)


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


	
	def index

		@cats = Category.roots #возвращает путь самой главной категории
		#@cats[2].name = "mors"
		#@cats[2].save
		#@cats = Category.all #возвращает все категории из базы данных
		#logger.debug"cc = #{@cats[2].to_param}"
	end


end

