require 'rails_helper'
# User Story 2, Parent Show
#
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table
RSpec.describe "breweries show page", type: :feature do
  it 'can show the brewery name with the assoicated id' do
    new_belgium = Brewery.create(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    visit "/breweries/#{new_belgium.id}"
    expect(page).to have_content(new_belgium.name)
  end

    it 'displays the breweries age' do
      new_belgium = Brewery.create(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
      visit "/breweries/#{new_belgium.id}"
      expect(page).to have_content(new_belgium.age)
    end

    it 'displays if the brewery is pet friendly' do
      new_belgium = Brewery.create(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
      visit "/breweries/#{new_belgium.id}"
      # save_and_open_page
      expect(page).to have_content(new_belgium.pet_friendly)
    end
end
