class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.bigint :response_user_id
      t.date :flyer_city_start_date
      t.date :flyer_city_end_date
      t.date :shopper_city_arrival_date
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
