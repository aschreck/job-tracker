class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end 

	def new
		@category = Category.new
		@category.save
	end 

	def create
		@category= Category.new(category_params)
		@category.save

		redirect to category_path(@category)
	end 

	def edit
		@category = Category.find(params[:id])
	end 

	def update
		@category = Category.find(params[:id])
		@category.update(category_params)

		redirect_to category_path(@category)
	end 

	def show
		@category = Category.find(params[:id])
	end 

	def destroy
		category = Category.find(params[:id])
		category.destroy

		redirect_to "/categories"
	end 

	private

	def category_params
		params.require(:category).permit(:title)
	end 
end 
