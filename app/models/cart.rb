class Cart < ActiveRecord::Base
  has_many :cart_items

  before_create :set_created

  def set_created
  	self.created = Time.now.utc.to_i
  end

end