class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			#redirect_to root_path, notice: "Successfully created Order"
			redirect_to category_path(@product.category_id), notice: "Successfully added Product to Category"
		end
	end

	def new
		@product = Product.new
	end

	def show
		@product = Product.find(params[:id])
	end

	private

	def product_params
		params[:product].permit(:size, :category_id)
		# Protecting from mass assignment - which is a security feature.
	end

end
