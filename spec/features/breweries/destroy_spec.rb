require 'rails_helper'


RSpec.describe 'Delete Breweries' do
#User Story 19, Parent Delete
# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent
it 'can delete a brewery and all beer records assoicated with the brewery' do
  new_belgium = Brewery.create(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
  visit "/breweries/#{new_belgium.id}"

  click_link 'Delete Brewery'

  expect(current_path).to eq("/breweries")

  expect(page).to_not have_content(new_belgium.name)
  expect(page).to_not have_content(new_belgium.age)
  expect(page).to_not have_content(new_belgium.pet_friendly)
  expect(page).to_not have_link('Delete Brewery')
end
# User Story 22, Parent Delete From Parent Index Page
# As a visitor
# When I visit the parent index page
# Next to every parent, I see a link to delete that parent
# When I click the link
# I am returned to the Parent Index Page where I no longer see that parent
  it 'can delete a brewery from the brewery index page' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    visit "/breweries"
    click_link 'Delete Brewery'
    expect(current_path).to eq("/breweries")
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
    visit '/breweries'
    click_link "Delete Brewery"
    expect(current_path).to eq("/breweries")
  end
end
