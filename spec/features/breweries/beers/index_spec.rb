require 'rails_helper'

RSpec.describe "Breweries beers index" do
  #Story_5, Brewery Beers Index
  #As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes:
  it 'shows all of the beers for the breweries' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)

    visit "/breweries/#{new_belgium.id}/beers"

    expect(page).to have_content(beer_1.name)
  end
end
