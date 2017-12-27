class Order < ActiveRecord::Base

	belongs_to :customer
	belongs_to :sauda
	has_many :order_products
	has_many :order_rates
	accepts_nested_attributes_for :order_products

	before_save :generate_initial_order_details


	def generate_initial_order_details
		
		if Order.exists?
			order = Order.order(:id).last
			self.order_number = "NTPLO - #{order.id + 1}"
		else
			self.order_number = "NTPLO - 1"
		end

		#self.sauda.is_order_taken = true

		#self.customer_id = @sauda.customer_id
		#self.sauda_id = @sauda.id
		self.order_date = Date.today
	end
end
