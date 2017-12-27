class OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def create
		


		params[:order][:order_products_attributes].each do |layer_number, subparams|
			#binding.pry
			if(subparams[:product_id] == "")
  				params[:order][:order_products_attributes].delete(layer_number)
  			end
  		end

		@sauda = Sauda.find(params[:sauda_id])
		@order = Order.new(order_params)


		@order.customer_id = @sauda.customer_id
		@order.sauda_id = @sauda.id

		@order.total = 0
  		
		@order.order_products.each do |order_product|
			#This will update the price of each orderitem by extracting the rate from the respective sauda line item
			#ToDo: The logic here may need to be modified for nails since depending on the sauda rate, the price is different for different sizes
			order_product[:price] = @sauda.sauda_line_items.find_by(category_id: order_product.product.category[:id])[:rate]
			@order.total += order_product[:order_quantity] * order_product[:price]	
		end

		#binding.pry
		if @order.save
			#redirect_to root_path, notice: "Successfully created Order"
			@sauda.update_sauda_order
			redirect_to sauda_order_path(@sauda, @order), notice: "Successfully added Order"
		end
	end

	def new
		@sauda = Sauda.find(params[:sauda_id])
		@order = Order.new
		@sauda_line_items = @sauda.sauda_line_items
		@order.order_products.build
	end

	def show
		@order = Order.find(params[:id])
	end

	private

	def order_params
		params[:order].permit(:sauda_id, :customer_id, order_products_attributes: [:order_id, :product_id, :order_quantity])
	end



end
