class MainController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:search]
      @bugcycles = Bugcycle.search(params[:search]).paginate(page: params[:page], per_page: 12)
    else
      @bugcycles = Bugcycle.paginate(page: params[:page], per_page: 12)
    end
  end
end
