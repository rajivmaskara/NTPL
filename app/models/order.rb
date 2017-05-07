class Order < ActiveRecord::Base

	belongs_to :customer
	has_many :order_products
	has_many :order_rates
end
