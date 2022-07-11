class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.all.order_by_time_created
  end

  def show
    @brewery = Brewery.find(params[:id])
    @brewery_beer_count = @brewery.count_of_beers
  end

  def new
  end

  def create
    Brewery.create(brewery_params)
    redirect_to '/breweries'
  end

  private
  def brewery_params
    params.permit(:name, :age, :pet_friendly)
  end
end
