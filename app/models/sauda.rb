class Sauda < ActiveRecord::Base
	belongs_to :customer
	has_many :sauda_line_items
	accepts_nested_attributes_for :sauda_line_items


	before_save :generate_initial_sauda_details

	def generate_initial_sauda_details
		
		if Sauda.exists?
			sauda = Sauda.order(:id).last
			self.sauda_number = "NTPL - #{sauda.id + 1}"
		else
			self.sauda_number = "NTPL - 1"
		end

		self.sauda_date = Date.today
		
	end
end
