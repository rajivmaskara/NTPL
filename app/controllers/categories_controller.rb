class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			#redirect_to root_path, notice: "Successfully created Order"
			redirect_to category_path(@category), notice: "Successfully added Category"
		

		end
	end

	def new
		@category = Category.new
	end

	def show
		@category = Category.find(params[:id])
	end

	private

	def category_params
		params[:category].permit(:name)
		# Protecting from mass assignment - which is a security feature.
	end


end
