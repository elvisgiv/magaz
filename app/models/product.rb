class Product < ActiveRecord::Base
	paginates_per 2
	belongs_to :category
end
