class CustomersController < ApplicationController
	def index
		@customers = Customer.all
	end



	def create
		@customer = Customer.new(customer_params)
		if @customer.save
			#redirect_to root_path, notice: "Successfully created Order"
			redirect_to customer_path(@customer), notice: "Successfully added Customer"
		

		end
	end

	def new
		@customer = Customer.new
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def destroy
		@customer = Customer.find(params[:id])
		@customer.destroy
		redirect_to customers_path, notice: "Customer #{@customer.id} successfully deleted"
	end

	private

	def customer_params
		params[:customer].permit(:customer_name, :phone_no, :location)
		# Protecting from mass assignment - which is a security feature.
	end


end
