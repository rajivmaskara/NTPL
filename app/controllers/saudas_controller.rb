class SaudasController < ApplicationController
	
	def index
		@saudas = Sauda.all
	end

	def new
		@sauda = Sauda.new
		#binding.pry
		Category.count.times {@sauda.sauda_line_items.build}
		#binding.pry
	end

	def create
		binding.pry
		@sauda = Sauda.new(sauda_params)
		binding.pry
		if(@sauda.save)
			redirect_to sauda_path(@sauda), notice: "Successfully added Sauda"
		end


	end

	def show
		@sauda = Sauda.find(params[:id])
	end

	private

	def sauda_params
		params[:sauda].permit(:customer_id, :is_order_taken, :is_delivered, sauda_line_items_attributes: [:category_id, :rate, :quantity] )
		# Protecting from mass assignment - which is a security feature.
	end



end
