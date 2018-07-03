class BugcyclesController < ApplicationController
  before_action :set_bugcycle, only: [:show, :edit, :update, :destroy]

  def index
    used = current_user.useds

    if params[:search]
      @bugcycles = current_user.bugcycles.not_used(used).search(params[:search]).paginate(page: params[:page], per_page: 12)
    else
      @bugcycles = current_user.bugcycles.not_used(used).paginate(page: params[:page], per_page: 12)
    end
  end

  def show; end

  def new
    @bugcycle = Bugcycle.new
  end

  def create
    @bugcycle = Bugcycle.new(bugcycle_params)

    if @bugcycle.save
      redirect_to bugcycles_url
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @bugcycle.update_attributes(bugcycle_params)
      redirect_to bugcycles_url
    else
      render 'edit'
    end
  end

  def destroy
    if @bugcycle.destroy
      redirect_to bugcycles_url
    else
      render 'index'
    end
  end

  def used
    Used.create(bugcycle_id: params[:id], user_id: current_user.id)
    redirect_to params[:url]
  end

  def by_category
    @bugcycles = Bugcycle.where(category_id: params[:category_id])
  end

  private

  def set_bugcycle
    @bugcycle = Bugcycle.find(params[:id])
  end

  def bugcycle_params
    params.require(:bugcycle).permit(:name, :description, :image, :category_id).merge(user_id: current_user.id)
  end
end
