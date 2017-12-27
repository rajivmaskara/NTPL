class SaudasController < ApplicationController
	
	def index
		@saudas = Sauda.all
	end

	def new
		@sauda = Sauda.new
		
		#This is to allow nested parameters forms from within the Sauda Form
		#So this allows sauda
		Category.count.times {@sauda.sauda_line_items.build}
		#binding.pry
	end

	def create
		
		#Not all ProductCategories will have a Sauda, hence some will be left blank 
      	#This will ensure that all those blank values do not get udated in the Database
      	params[:sauda][:sauda_line_items_attributes].each do |layer_number, subparams|
  			if(subparams[:category_id] == "")
  				params[:sauda][:sauda_line_items_attributes].delete(layer_number)
  			end
  		end
      	
      	#binding.pry
		@sauda = Sauda.new(sauda_params)
		#binding.pry
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
