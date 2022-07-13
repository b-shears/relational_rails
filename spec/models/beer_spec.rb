require "rails_helper"

RSpec.describe Beer, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should allow_value(true).for(:in_stock) }
    it { should allow_value(false).for(:in_stock) }
    it { should validate_presence_of :style }
    it { should validate_presence_of :review_rating }
  end

  describe 'relationships' do
    it { should belong_to(:brewery)}
  end
  # User Story 15, Child Index only shows `true` Records
  # As a visitor
  # When I visit the child index
  # Then I only see records where the boolean column is `true`
  it 'returns the beers that are in stock' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    beer_2 = new_belgium.beers.create(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)

    expect(new_belgium.beers.show_beers_in_stock).to eq([beer_2])
    expect(new_belgium.beers.show_beers_in_stock.count).to eq(1)
  end

  # User Story 16, Sort Parent's Children in Alphabetical Order by name
  # As a visitor
  # When I visit the Parent's children Index Page
  # Then I see a link to sort children in alphabetical order
  # When I click on the link
  # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
  it 'orders beers alphabetically' do
    new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
    beer_1 = new_belgium.beers.create(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
    beer_2 = new_belgium.beers.create(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
    expect(new_belgium.beers.all.first.id).to eq(beer_1.id)
    expect(new_belgium.beers.all.last.id).to eq(beer_2.id)
    expect(new_belgium.beers.sort_beers_alphabetically.first.id).to eq(beer_2.id)
    expect(new_belgium.beers.sort_beers_alphabetically.last.id).to eq(beer_1.id)
  end
end
