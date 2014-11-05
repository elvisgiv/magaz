class ShippingMethod < ActiveRecord::Base
	
	has_many :orders
	

end
