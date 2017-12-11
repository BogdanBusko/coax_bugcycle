class BugcyclesController < ApplicationController
  before_action :set_bugcycle, only: [:edit, :update, :destroy]  
  
  def new
    @bugcycle = Bugcycle.new
  end

  def create
    @bugcycle = Bugcycle.new(bugcycle_params)

    if @bugcycle.save
      redirect_to root_path
    else 
      render 'new'
    end
  end

  def edit; end

  def update
    if @bugcycle.update_attributes(bugcycle_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @bugcycle.destroy
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_bugcycle
    @bugcycle = Bugcycle.find(params[:id])
  end

  def bugcycle_params
    params.require(:bugcycle).permit(:name, :description, :image)
  end
end
