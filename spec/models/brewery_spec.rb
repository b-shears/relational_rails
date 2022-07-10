require 'rails_helper'

RSpec.describe Brewery, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should allow_value(true).for(:pet_friendly) }
    it { should allow_value(false).for(:pet_friendly) }
  end
  describe 'relationships' do
    it { should have_many :beers }
  end

  describe "::order_by_time_created" do
    it 'orders breweries correctly by most recently created' do
      new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true, created_at: 15.seconds.ago)
      odell = Brewery.create!(name: 'Odell Brewing', age: 33, pet_friendly: true, created_at: 3.seconds.ago)
      funkwerks = Brewery.create!(name: 'Funkwerks', age: 12, pet_friendly: true, created_at: 10.seconds.ago)
      aleworks = Brewery.create!(name: 'Loveland Aleworks', age: 10, pet_friendly: false, created_at: 1.seconds.ago)
      expect(Brewery.order_by_time_created).to eq([aleworks, odell, funkwerks, new_belgium])
    end
  end

  describe 'count_of_beers' do
    it 'returns the count of beers at a brewery' do
      new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
      beer_1 = new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
      beer_2 = new_belgium.beers.create!(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)
      expect(new_belgium.count_of_beers).to eq(2)
    end
end
end
