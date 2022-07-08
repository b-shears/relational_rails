class Brewery < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age 
  validates :pet_friendly, inclusion: [true, false]
  has_many :beers
end
