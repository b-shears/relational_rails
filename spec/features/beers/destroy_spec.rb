require 'rails_helper'

RSpec.describe 'Destroy Beers' do
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
