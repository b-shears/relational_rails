require 'rails_helper'

RSpec.describe "Breweries beers index" do
  before :each do
    @new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    @beer_1 = @new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    @beer_2 = @new_belgium.beers.create!(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
  end
  it 'shows all of the beers for the breweries' do
    visit "/breweries/#{@new_belgium.id}/beers"

    expect(page).to have_content(@beer_1.name)
    expect(page).to have_content(@beer_2.name)
  end

  # it 'links to each songs show page' do
  #
  # end

end
