# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_24_085510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string "movie_name"
    t.integer "rows"
    t.integer "column"
    t.text "summary"
    t.string "genre"
    t.integer "year"
    t.string "imdb"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "venue_id"
    t.index ["venue_id"], name: "index_movies_on_venue_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "row"
    t.integer "column"
    t.string "status"
    t.bigint "movie_id", null: false
    t.string "seat_combination"
    t.index ["movie_id"], name: "index_seats_on_movie_id"
  end

  create_table "venues", force: :cascade do |t|
    t.integer "rows"
    t.integer "columns"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "seats", "movies"
end
