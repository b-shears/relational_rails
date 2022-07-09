require 'rails_helper'

RSpec.describe "breweries index page", type: :feature do
  it "displays the brewery name in the index" do
    new_belgium = Brewery.create(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    odell = Brewery.create(name: 'Odell Brewing', age: 33, pet_friendly: true)
    funkwerks = Brewery.create(name: 'Funkwerks', age: 12, pet_friendly: true)
    aleworks = Brewery.create(name: 'Loveland Aleworks', age: 10, pet_friendly: false)
    visit "/breweries"
    expect(page).to have_content(new_belgium.name)
  end
end
