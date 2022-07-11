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

  # User Story 13, Parent Child Creation
    # As a visitor
    # When I visit a Parent Childs Index page
    # Then I see a link to add a new adoptable child for that parent "Create Child"
    # When I click the link
    # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
    # When I fill in the form with the child's attributes:
    # And I click the button "Create Child"
    # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
    # a new child object/row is created for that parent,
    # and I am redirected to the Parent Childs Index page where I can see the new child listed

    it 'has a link that takes the user to a page to create a new beer' do
        new_belgium = Brewery.create!(name: 'New Belgium Brewing', age: 31, pet_friendly: true)
        beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
        visit "/breweries/#{@brewery.id}/beers"
        click_link "Create Beer"
        expect(current_path).to eq("/breweries/#{@brewery.id}/beers/new")
    end

    it 'when I click the button it sends a POST request & I am redirected to the index page' do
      new_belgium = Brewery.create!(name: 'New Belgium Brewing', age: 31, pet_friendly: true)
      beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
      visit "/breweries/#{@brewery.id}/beers/new"
      fill_in 'Name', with: 'New Beer'
      fill_in 'Style', with: 'Pilsner'
      fill_in 'review_rating', with: 10
      fill_in 'in_stock', with: true
      click_button "Create Beer"
      expect(current_path).to eq("/breweries/#{@brewery.id}/beers")
      expect(page).to have_content(@beer_1.name)
      expect(page).to have_content(@beer_1.style)
      expect(page).to have_content(@beer_1.review_rating)
      expect(page).to have_content(@beer_1.in_stock)
    end



end
