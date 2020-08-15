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

ActiveRecord::Schema.define(version: 2020_08_15_014638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drinks", force: :cascade do |t|
    t.string "name"
    t.integer "volume"
    t.integer "age"
    t.string "brand"
    t.integer "type"
    t.decimal "advice_price", precision: 10, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "premise_drinks", force: :cascade do |t|
    t.bigint "premise_id"
    t.bigint "drink_id"
    t.decimal "price", precision: 10, scale: 4
    t.boolean "in_stock"
    t.integer "amount"
    t.boolean "on_sale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drink_id"], name: "index_premise_drinks_on_drink_id"
    t.index ["premise_id"], name: "index_premise_drinks_on_premise_id"
  end

  create_table "premises", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "post_code"
    t.string "license_no"
    t.string "suburb"
    t.decimal "latitude", precision: 10, scale: 7
    t.decimal "longitude", precision: 10, scale: 7
    t.boolean "gaming"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "premise_drinks", "drinks"
  add_foreign_key "premise_drinks", "premises"
end
