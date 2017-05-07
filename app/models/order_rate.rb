class OrderRate < ActiveRecord::Base
	belongs_to :order
	belongs_to :category
end
