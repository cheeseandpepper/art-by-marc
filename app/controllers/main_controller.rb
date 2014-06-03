class MainController < ApplicationController

  def index
    @paintings = Painting.all
  end

  def show
    @painting = Painting.find(params[:id])
  end

  def about
  end

  def contact
  end

end
