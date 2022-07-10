class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.all.order_by_time_created
  end

  def show
    @brewery = Brewery.find(params[:id])
  end

end
