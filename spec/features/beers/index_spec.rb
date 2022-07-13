require 'rails_helper'

RSpec.describe "beers index page", type: :feature  do
  it 'displays the beer names in the index' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    beer_2 = new_belgium.beers.create(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
    visit "/beers"
    expect(page).to have_content(beer_2.name)
    expect(page).to_not have_content(beer_1.name)
  end

  it 'displays the style of beer' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    beer_2 = new_belgium.beers.create(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
    # save_and_open_page
    visit "/beers"
    expect(page).to_not have_content(beer_1.style)
    expect(page).to have_content(beer_2.style)
  end

  it 'displays the review rating of the beer' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    beer_2 = new_belgium.beers.create(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
    visit "/beers"
    expect(page).to_not have_content(beer_1.review_rating)
    expect(page).to have_content(beer_2.review_rating)
  end

  it 'displays if the beer is in stock' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    beer_2 = new_belgium.beers.create(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
    visit "/beers"
    expect(page).to_not have_content(beer_1.review_rating)
    expect(page).to have_content(beer_2.in_stock)
  end
  # user story 8
  it 'links to the child index' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    beer_2 = new_belgium.beers.create(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
    visit "/beers"
    expect(page).to have_link('Beers Index', href: '/beers')
  end
  # user story 9
  it 'links to the parent index' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    beer_2 = new_belgium.beers.create(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
    visit "/beers"
    expect(page).to have_link('Brewery Index', href: '/breweries')
  end


# User Story 15, Child Index only shows `true` Records
# As a visitor
# When I visit the child index
# Then I only see records where the boolean column is `true`

  it 'only shows beers that are in_stock when I visit the child index' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    beer_2 = new_belgium.beers.create(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)

    visit "/beers"
    # save_and_open_page
    expect(page).to have_content(beer_2.name)
    expect(page).to have_content(beer_2.style)
    expect(page).to have_content(beer_2.review_rating)
    expect(page).to have_content(beer_2.in_stock)
    expect(page).to_not have_content(beer_1.name)
    expect(page).to_not have_content(beer_1.style)
    expect(page).to_not have_content(beer_1.review_rating)
    expect(page).to_not have_content(beer_1.style)
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
    beer_2 = new_belgium.beers.create(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
    visit "/beers"

    within '#beer-0' do
      click_link 'Edit Beer'
      expect(current_path).to eq("/beers/#{beer_2.id}/edit")
    end
  end
end
