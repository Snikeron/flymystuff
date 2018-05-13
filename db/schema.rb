# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180513163845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "postcode"
    t.string "country_code"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "flytes", force: :cascade do |t|
    t.integer "flyer_id"
    t.bigint "listing_id"
    t.decimal "deposit_amount"
    t.date "flyer_depart"
    t.date "flyer_arrive"
    t.string "handover_method"
    t.datetime "item_received"
    t.datetime "item_enroute"
    t.datetime "item_arrived"
    t.text "item_image_data"
    t.datetime "item_delivered"
    t.decimal "payment_amount"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_flytes_on_listing_id"
    t.index ["user_id"], name: "index_flytes_on_user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "shopper_city"
    t.string "flyer_city"
    t.text "item_description"
    t.text "listing_image_data"
    t.decimal "price"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "shopper_flytes", default: 0
    t.integer "flyer_flytes", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "response_user_id"
    t.date "flyer_city_start_date"
    t.date "flyer_city_end_date"
    t.date "shopper_city_arrival_date"
    t.bigint "user_id"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_responses_on_listing_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "flytes", "listings"
  add_foreign_key "flytes", "users"
  add_foreign_key "listings", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "responses", "listings"
  add_foreign_key "responses", "users"
end
