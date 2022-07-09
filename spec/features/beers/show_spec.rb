require 'rails_helper'

RSpec.describe 'beers show page' do
  it 'can show the beers name with that id including the beers attributes' do
    @new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    @beer_1 = @new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    @beer_2 = @new_belgium.beers.create!(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
  end


end
