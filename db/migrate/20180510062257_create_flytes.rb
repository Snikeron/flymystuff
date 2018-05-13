class CreateFlytes < ActiveRecord::Migration[5.1]
  def change
    create_table :flytes do |t|
      t.integer :flyer_id
      t.integer :listing_id
      t.decimal :deposit_amount
      t.date :flyer_depart
      t.date :flyer_arrive
      t.string :handover_method
      t.datetime :item_received
      t.datetime :item_enroute
      t.datetime :item_arrived
      t.text :item_image_data
      t.datetime :item_delivered
      t.decimal :payment_amount
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
