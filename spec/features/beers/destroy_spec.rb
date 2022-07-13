require 'rails_helper'

RSpec.describe 'Destroy Beers' do

  # User Story 20, Child Delete
  # As a visitor
  # When I visit a child show page
  # Then I see a link to delete the child "Delete Child"
  # When I click the link
  # Then a 'DELETE' request is sent to '/child_table_name/:id',
  # the child is deleted,
  # and I am redirected to the child index page where I no longer see this child

  it 'can delete a beer with a link on the beers show page' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: true)
    visit "/beers/#{beer_1.id}"

    click_link 'Delete Beer'

    expect(current_path).to eq('/beers')

    expect(page).to_not have_content(beer_1.name)
    expect(page).to_not have_content(beer_1.style)
    expect(page).to_not have_content(beer_1.review_rating)
    expect(page).to_not have_content(beer_1.in_stock)
    expect(page).to_not have_link('Delete Beer')
  end

# User Story 23, Child Delete From Childs Index Page
# As a visitor
# When I visit the `child_table_name` index page or a parent `child_table_name` index page
# Next to every child, I see a link to delete that child
# When I click the link
# I should be taken to the `child_table_name` index page where I no longer see that child

  it 'can delete beers from the beers index page' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    beer_2 = new_belgium.beers.create(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
    visit '/beers'
    click_link "Delete Beer"
    expect(current_path).to eq("/beers")
  end
end
