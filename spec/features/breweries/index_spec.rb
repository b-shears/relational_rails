require 'rails_helper'

RSpec.describe "breweries index page", type: :feature do
  it "displays the brewery name in the index" do
    new_belgium = Brewery.create(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    visit "/breweries"
    expect(page).to have_content(new_belgium.name)
  end
end
