module ApplicationHelper

	def breadcrumbs(category, product)
=begin 
			if category.nil?
				return []
			 elsif product.nil?
				return [{:url=>categories_path, :title=>'categories'},
					{:url=>category_path(category), :title=>category.name}]
			 else
				return [{:url=>categories_path, :title=>'categories'},
					{:url=>category_path(category), :title=>category.name},
				{:url=>product_path(product), :title=>product.name}]
			end
=end
		a = []
		return a if category.nil?
		
		a << {:url=>categories_path, :title=>'categories'}

		b = category.self_and_ancestors #метод self_and_ancectors - это метод awesome_nested_set-а, который фозвращает массив родителей включая себя
			b.each do |c|
			a << {:url=>category_path(c), :title=>c.name} #присваиваем к каждому пути конкретную с, взятую из массива b с = категория
			end
		return a if product.nil?
		
		
		a << {:url=>product_path(product), :title=>product.name}
		return a
		
	end

end
