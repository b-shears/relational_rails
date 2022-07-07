class CreateBrewery < ActiveRecord::Migration[5.2]
  def change
    create_table :breweries do |t|
      t.string :name
      t.integer :age
      t.boolean :pet_friendly
      t.timestamps 
    end
  end
end
