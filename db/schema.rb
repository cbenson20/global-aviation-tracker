# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_11_03_014753) do
  create_table "airlines", force: :cascade do |t|
    t.integer "openflights_id"
    t.string "name"
    t.string "alias"
    t.string "iata"
    t.string "icao"
    t.string "callsign"
    t.string "country"
    t.string "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "openflights_id"
    t.string "iata"
    t.string "icao"
    t.float "latitude"
    t.float "longitude"
    t.integer "altitude"
    t.float "timezone"
    t.string "dst"
    t.string "tz"
  end

  create_table "routes", force: :cascade do |t|
    t.integer "openflights_id"
    t.integer "airline_id"
    t.integer "source_airport_id"
    t.integer "dest_airport_id"
    t.string "codeshare"
    t.integer "stops"
    t.string "equipment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airline_id"], name: "index_routes_on_airline_id"
    t.index ["dest_airport_id"], name: "index_routes_on_dest_airport_id"
    t.index ["source_airport_id"], name: "index_routes_on_source_airport_id"
  end

  add_foreign_key "routes", "airlines"
  add_foreign_key "routes", "airports", column: "dest_airport_id"
  add_foreign_key "routes", "airports", column: "source_airport_id"
end
