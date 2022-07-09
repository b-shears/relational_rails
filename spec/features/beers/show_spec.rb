require 'rails_helper'

RSpec.describe 'beers show page' do
  before :each do
    @new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    @beer_1 = @new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    # @beer_2 = @new_belgium.beers.create!(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
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
end