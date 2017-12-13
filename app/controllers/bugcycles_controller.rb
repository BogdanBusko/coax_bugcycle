class BugcyclesController < ApplicationController
  before_action :set_bugcycle, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit]
  
  def index
    @bugcycles = current_user.bugcycles.all
  end

  def show; end

  def new
    @bugcycle = current_user.bugcycles.new
  end

  def create
    @bugcycle = current_user.bugcycles.new(bugcycle_params)

    if @bugcycle.save
      redirect_to bugcycles_url, notice: 'Successfully created!'
    else 
      render 'new'
    end
  end

  def edit; end

  def update
    if @bugcycle.update_attributes(bugcycle_params)
      redirect_to bugcycles_url, notice: 'Successfully updated!'
    else
      render 'edit'
    end
  end

  def destroy
    if @bugcycle.destroy
      redirect_to bugcycles_url, notice: 'Successfully destroyed!'
    else
      render 'index'
    end
  end

  private

  def set_bugcycle
    @bugcycle = current_user.bugcycles.find(params[:id])
  end

  def set_categories
    @category = Category.all
  end

  def bugcycle_params
    params.require(:bugcycle).permit(:name, :description, :image, :category_id)
  end
end
