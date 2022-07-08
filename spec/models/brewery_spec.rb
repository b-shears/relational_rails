require 'rails_helper'

describe Brewery, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should allow_value(true).for(:pet_friendly) }
    it { should allow_value(false).for(:pet_friendly) }
  end
  describe 'relationships' do
    it { should have_many :beers }
  end
end
