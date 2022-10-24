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

ActiveRecord::Schema[7.0].define(version: 2022_10_24_073503) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bikes", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "cruising_distance"
    t.integer "displacement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "manufacture_id"
    t.index ["manufacture_id"], name: "index_bikes_on_manufacture_id"
  end

  create_table "illustrations", force: :cascade do |t|
    t.string "body_image"
    t.string "wheel_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manufactures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_bikes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "bike_id", null: false
    t.string "bike_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bike_id"], name: "index_user_bikes_on_bike_id"
    t.index ["user_id"], name: "index_user_bikes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visited_places", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "place_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_visited_places_on_place_id"
    t.index ["user_id"], name: "index_visited_places_on_user_id"
  end

  add_foreign_key "bikes", "manufactures"
  add_foreign_key "user_bikes", "bikes"
  add_foreign_key "user_bikes", "users"
  add_foreign_key "visited_places", "places"
  add_foreign_key "visited_places", "users"
end
