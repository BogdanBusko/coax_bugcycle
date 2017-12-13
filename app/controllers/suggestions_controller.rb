class SuggestionsController < ApplicationController
  before_action :set_bugcycle
  
  def approve
    suggestion = Suggestion.find(params[:suggestion_id])

    if @bugcycle.update_attributes(suggestion.attributes.except('id', 'bugcycle_id', 'user_id'))
      suggestion.destroy
      redirect_to bugcycle_url(@bugcycle), notice: 'Suggestion apply...'
    else
      redirect_to bugcycle_url(@bugcycle)
    end
  end

  def new
    @categories = Category.all
    @suggestion = @bugcycle.suggestions.new
  end

  def create
    @categories = Category.all
    @suggestion = @bugcycle.suggestions.new(suggestion_params)

    if @suggestion.save
      redirect_to root_path, notice: 'Suggestion send...'
    else
      render 'new'
    end
  end

  def destroy
    @bugcycle.suggestions.find(params[:id]).destroy
    redirect_to bugcycle_url(@bugcycle)
  end

  def destroy_all
    @bugcycle.suggestions.delete_all
    redirect_to bugcycle_url(@bugcycle)
  end

  private

  def set_bugcycle
    @bugcycle = Bugcycle.find(params[:bugcycle_id])
  end

  def suggestion_params
    params.require(:suggestion).permit(:name, :description, :image, :category_id).merge(user_id: current_user.id)
  end
end
