class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @bugcycles = @category.bugcycles
  end
end
