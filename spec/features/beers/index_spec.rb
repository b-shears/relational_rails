require 'rails_helper'

RSpec.describe "beers index page", type: :feature  do
  it 'displays the beer names in the index' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    visit "/beers"
    expect(page).to have_content(beer_1.name)
  end

  it 'displays the style of beer' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    visit "/beers"
    expect(page).to have_content(beer_1.style)
  end

  it 'displays the review rating of the beer' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    visit "/beers"
    expect(page).to have_content(beer_1.review_rating)
  end

  it 'displays if the beer is in stock' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    visit "/beers"
    expect(page).to have_content(beer_1.in_stock)
  end
  # user story 8
  it 'links to the child index' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    visit "/beers"
    expect(page).to have_link('Beers Index', href: '/beers')
  end
  # user story 9
  it 'links to the parent index' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    visit "/beers"
    expect(page).to have_link('Brewery Index', href: '/breweries')
  end
# User Story 18, Child Update From Childs Index Page
# As a visitor
# When I visit the `child_table_name` index page or a parent `child_table_name` index page
# Next to every child, I see a link to edit that child's info
# When I click the link
# I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
  it 'links to edit a beers info from the beers index page' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    visit "/beers"
    # save_and_open_page
    click_link 'Edit Beer'
    expect(current_path).to eq("/beers/#{beer_1.id}/edit")
  end
end
