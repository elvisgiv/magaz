class Category < ActiveRecord::Base
	
	acts_as_nested_set
	has_many :products

	extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]
	
	
end
