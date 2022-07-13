class BreweryBeersController < ApplicationController
  def index
    @brewery = Brewery.find(params[:brewery_id])
    require "pry"; binding.pry
    if params[:sort] == 'alphabet'
      @beers = @brewery.beers.sort_beers_alphabetically
    else
      @beers = @brewery.beers
    end
  end

  def new
    @brewery = Brewery.find(params[:brewery_id])
  end

  def create
    @brewery = Brewery.find(params[:brewery_id])
    @brewery.beers.create(brewery_params)
    redirect_to
    "/breweries/#{@brewery.id}/beers"
  end

  private
  def brewery_params
    params.permit(:name, :style, :review_rating, :in_stock)
  end
end
