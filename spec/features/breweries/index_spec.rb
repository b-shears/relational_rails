require 'rails_helper'

RSpec.describe "breweries index page", type: :feature do
  it "displays the brewery name in the index" do
    new_belgium = Brewery.create(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    visit "/breweries"
    expect(page).to have_content(new_belgium.name)
  end

  it 'orders the index by most recently create_at brewery' do
    new_belgium = Brewery.create!(name: 'New Belgium Brewing', age: 31, pet_friendly: true, created_at: 15.seconds.ago)
    odell = Brewery.create!(name: 'Odell Brewing', age: 33, pet_friendly: true, created_at: 3.seconds.ago)
    funkwerks = Brewery.create!(name: 'Funkwerks', age: 12, pet_friendly: true, created_at: 10.seconds.ago)
    aleworks = Brewery.create!(name: 'Loveland Aleworks', age: 10, pet_friendly: false, created_at: 1.seconds.ago)
    visit '/breweries'
    save_and_open_page

    within '#brewery-0' do
      expect(page).to have_content('Loveland Aleworks')
    end

    within '#brewery-1' do
      expect(page).to have_content('Odell Brewing')
    end

    within '#brewery-2' do
      expect(page).to have_content('Funkwerks')
    end

    within '#brewery-3' do
      expect(page).to have_content('New Belgium Brewing')
    end
  end

 #  As a visitor
 # # When I visit any page on the site
 # # Then I see a link at the top of the page that takes me to the Child Index
   it 'links to the child index' do
     visit "/breweries"
     expect(page).to have_link('Beers Index', href: '/beers')
   end
end
