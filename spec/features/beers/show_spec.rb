  require 'rails_helper'

RSpec.describe 'beers show page' do
  before :each do
    @new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    @beer_1 = @new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
  end

  it 'can show the beers name with the corresponding id' do
    visit "/beers/#{@beer_1.id}"
    expect(page).to have_content(@beer_1.name)
  end

  it 'can show the beers style' do
    visit "/beers/#{@beer_1.id}"
    expect(page).to have_content(@beer_1.style)
  end

  it 'can show the beers review rating' do
    visit "/beers/#{@beer_1.id}"
    expect(page).to have_content(@beer_1.review_rating)
  end

  it 'can show if the beer is in stock' do
    visit "/beers/#{@beer_1.id}"
    expect(page).to have_content(@beer_1.in_stock)
  end

  it 'links to the child index' do
    visit "/beers"
    expect(page).to have_link('Beers Index', href: '/beers')
  end

  it 'links to the parent index' do
    visit "/beers"
    expect(page).to have_link('Brewery Index', href: '/breweries')
  end
end 
