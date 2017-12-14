class UsedsController < ApplicationController
  def create
    current_user.useds.create(bugcycle_id: params[:id])
    redirect_to params[:url]
  end
end
