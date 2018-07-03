class MainController < ApplicationController
  def index
    if user_signed_in?
      used = current_user.useds

      if params[:search]
        @bugcycles = Bugcycle.not_used(used).search(params[:search]).paginate(page: params[:page], per_page: 12)
      else
        @bugcycles = Bugcycle.not_used(used).paginate(page: params[:page], per_page: 12)
      end
    else
      if params[:search]
        @bugcycles = Bugcycle.search(params[:search]).paginate(page: params[:page], per_page: 12)
      else
        @bugcycles = Bugcycle.paginate(page: params[:page], per_page: 12)
      end
    end
  end
end
