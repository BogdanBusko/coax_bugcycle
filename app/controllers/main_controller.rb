class MainController < ApplicationController
  def index
    @bugcycles = Bugcycle.all
  end
end
