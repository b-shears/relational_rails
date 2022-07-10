class Brewery < ApplicationRecord
    has_many :beers
    validates_presence_of :name
    validates_presence_of :age
    validates :pet_friendly, inclusion: [true, false]

    def self.order_by_time_created
      order(created_at: :desc)
    end

    def count_of_beers
      beers.count
    end
end
