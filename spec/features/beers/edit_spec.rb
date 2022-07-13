require 'rails_helper'

RSpec.describe 'Update Beer' do
  # User Story 14, Beer Update
  # As a visitor
  # When I visit a Beer Show page
  # Then I see a link to update that Beer "Update Beer"
  # When I click the link
  # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
  # When I click the button to submit the form "Update Child"
  # Then a `PATCH` request is sent to '/child_table_name/:id',
  # the child's data is updated,
  # and I am redirected to the Child Show page where I see the Child's updated information

  it 'can update the attributes of a beer' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: true)
    visit "/beers/#{beer_1.id}"

    click_link "Update Beer"
  
    expect(current_path).to eq("/beers/#{beer_1.id}/edit")

    fill_in 'Name', with: 'New Beer'
    fill_in 'Style', with: 'Pilsner'
    fill_in 'review_rating', with: 10
    fill_in 'in_stock', with: true

    click_button "Update Beer"
    # save_and_open_page
    expect(current_path).to eq("/beers/#{beer_1.id}")
    expect(page).to have_content('New Beer')
    expect(page).to have_content('Pilsner')
    expect(page).to have_content(10)
    expect(page).to have_content(true)
  end
end
