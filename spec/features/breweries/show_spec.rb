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
      expect(page).to have_content(new_belgium.pet_friendly)
    end

    it 'displays if the brewery is pet friendly' do
      new_belgium = Brewery.create(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
      visit "/breweries/#{new_belgium.id}"
      expect(page).to have_content(new_belgium.pet_friendly)
    end

    it 'shows the count of beers for each brewery' do
      new_belgium = Brewery.create(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
      beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
      beer_2 = new_belgium.beers.create!(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
      visit "/breweries/#{new_belgium.id}"
      within '#/breweries'
      #
      expect(page).to include('Number of Beers: 2')
    end

    # user story 8
    it 'links to the child index' do
      new_belgium = Brewery.create(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
      beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
      beer_2 = new_belgium.beers.create!(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
      visit "/breweries/#{new_belgium.id}"
      expect(page).to have_link('Beers Index', href: '/beers')
    end
    # user story 9
    it 'shows a link to on the parents show page to take you to the beers page' do
      new_belgium = Brewery.create(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
      beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
      beer_2 = new_belgium.beers.create!(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
      visit "/breweries/#{new_belgium.id}"
      expect(page).to have_link('Brewery Index', href: '/breweries')
    end

    #User Story 10, Parent Child Index Link
    #As a visitor
    # When I visit a parent show page ('/parents/:id')
    #Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
    it 'has a link to take you to the breweries beer page' do
      new_belgium = Brewery.create(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
      beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
      beer_2 = new_belgium.beers.create!(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
      visit "/breweries/#{new_belgium.id}"
      expect(page).to have_link('Beers at Brewery', href: "/breweries/#{new_belgium.id}/beers")
    end

#User Story 11, Parent Creation
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.


end
