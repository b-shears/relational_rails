require 'rails_helper'
# As a visitor
# When I visit a Brewery Beers Index page
# Then I see a link to add a new beer for the Brewery "Create Beer"
# When I click the link
# I am taken to '/breweries/:brewery_id/beer_table_name/new' where I see a form to add a new beer
# When I fill in the form with the beer's attributes:
# And I click the button "Create Beer"
# Then a `POST` request is sent to '/breweries/:brewery_id/beer_table_name',
# a new beer object/row is created for that Brewery,
# and I am redirected to the Brewery Beers Index page where I can see the new beer listed

RSpec.describe 'brewery beers new' do
  it 'has a link that takes the user to a page to create a new beer' do
      new_belgium = Brewery.create!(name: 'New Belgium Brewing', age: 31, pet_friendly: true)
      visit "/breweries/#{new_belgium.id}/beers"

      click_link "Create Beer"

      expect(current_path).to eq("/breweries/#{new_belgium.id}/beers/new")
  end

  it 'has a form that you can fill in the new beers attributes' do
    new_belgium = Brewery.create!(name: 'New Belgium Brewing', age: 31, pet_friendly: true)

    visit "/breweries/#{new_belgium.id}/beers/new"

    fill_in 'Name', with: 'New Beer'
    fill_in 'Style', with: 'Pilsner'
    fill_in 'review_rating', with: 10
    fill_in 'in_stock', with: true
    # save_and_open_page
    click_button "Create Beer"

    expect(current_path).to eq("/breweries/#{new_belgium.id}/beers")

    expect(page).to have_content('New Beer')
    expect(page).to have_content('Pilsner')
    expect(page).to have_content(10)
    expect(page).to have_content(true)
  end
end
