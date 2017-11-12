class OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def create
		@order = Order.new
		if @order.save
			#redirect_to root_path, notice: "Successfully created Order"
			redirect_to order_path(@order), notice: "Successfully added Order"
		end
	end

	def new
		@order = Order.new
	end

	def show
		@order = Order.find(params[:id])
	end


end
