class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :shopper_city
      t.string :flyer_city
      t.text :item_description
      t.text :listing_image_data
      t.decimal :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
