require 'rails_helper'

RSpec.describe "Breweries Beers Index" do
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


# User Story 18, Child Update From Childs Index Page
# As a visitor
# When I visit the `child_table_name` index page or a parent `child_table_name` index page
# Next to every child, I see a link to edit that child's info
# When I click the link
# I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
  it 'has a link to edit the childs info in the brewery beers index page' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    visit "/breweries/#{new_belgium.id}/beers"
    # save_and_open_page
    click_link 'Edit Beer'
    expect(current_path).to eq("/beers/#{beer_1.id}/edit")
  end

end
