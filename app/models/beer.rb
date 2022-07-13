class Beer < ApplicationRecord
  belongs_to :brewery
  validates_presence_of :name
  validates_presence_of :style
  validates_presence_of :review_rating
  validates :in_stock, inclusion: [true, false]

  def self.show_beers_in_stock
    where(in_stock: true)
  end

  def self.sort_beers_alphabetically
    order(:name)
  end
end
