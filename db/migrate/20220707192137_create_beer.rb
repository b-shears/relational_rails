class CreateBeer < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :review_rating
      t.string :style
      t.boolean :in_stock
      t.references :brewery, foreign_key: true
      t.timestamps
    end
  end
end
