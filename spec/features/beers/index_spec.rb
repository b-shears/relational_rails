require 'rails_helper'

RSpec.describe "beers index page", type: :feature  do
  before :each do
    @new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    @beer_1 = @new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    @beer_2 = @new_belgium.beers.create!(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
  end

  it 'displays the beer names in the index' do
    visit "/beers"
    expect(page).to have_content(@beer_1.name)
    expect(page).to have_content(@beer_2.name)
  end

  it 'displays the style of beer' do
    visit "/beers"
    expect(page).to have_content(@beer_1.style)
    expect(page).to have_content(@beer_2.style)
  end

  it 'displays the review rating of the beer' do
    visit "/beers"
    expect(page).to have_content(@beer_1.review_rating)
    expect(page).to have_content(@beer_2.review_rating)
  end

  it 'displays if the beer is in stock' do
    visit "/beers"
    expect(page).to have_content(@beer_1.in_stock)
    expect(page).to have_content(@beer_2.in_stock)
  end
  # user story 8
  it 'links to the child index' do
    visit "/beers"
    expect(page).to have_link('Beers Index', href: '/beers')
  end
  # user story 9
  it 'links to the parent index' do
    visit "/beers"
    expect(page).to have_link('Brewery Index', href: '/breweries')
  end

end
