class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def show
    @category = Category.find(params[:id])
    @bugcycles = @category.bugcycles.where("name LIKE ?", "%#{params[:search]}%")
  end
end
