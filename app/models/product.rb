class Product < ActiveRecord::Base
	has_many :order_products
	belongs_to :category
end
