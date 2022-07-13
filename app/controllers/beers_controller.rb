class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def update
    @beer = Beer.find(params[:id])
    @beer.update(beers_params)
    redirect_to "/beers/#{@beer.id}"
  end

  def destroy
    Beer.destroy(params[:id])
    redirect_to "/beers"
  end

  private
  def beers_params
    params.permit(:name, :style, :review_rating, :in_stock)
  end
end
