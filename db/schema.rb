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

ActiveRecord::Schema.define(version: 20171129172944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.integer "api_id"
    t.integer "rating"
    t.string "name"
    t.string "country"
    t.float "lat"
    t.float "lon"
    t.string "photo_url", default: "https://c1.staticflickr.com/7/6101/6347529989_fba4717061_q.jpg"
  end

  create_table "forecasts", force: :cascade do |t|
    t.float "current_temp"
    t.float "wind_speed"
    t.integer "cloud_coverage"
    t.integer "weather_code"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_forecasts_on_city_id"
  end

end
