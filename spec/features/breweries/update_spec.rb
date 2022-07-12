require 'rails_helper'

RSpec.describe 'Update from Brewery Index' do
# User Story 17, Parent Update From Parent Index Page
# As a visitor
# When I visit the parent index page
# Next to every parent, I see a link to edit that parent's info
# When I click the link
# I should be taken to that parents edit page where I can update its information just like in User Story 4

  it 'can update a brewery from the brewery index' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    visit "/breweries"

    click_link "Update Brewery Info"
    expect(current_path).to eq("/breweries/#{brewery.id}/edit")
  end

end
