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

ActiveRecord::Schema.define(version: 2021_06_09_135056) do

  create_table "cds", force: :cascade do |t|
    t.string "format", null: false
    t.string "picture", null: false
    t.string "title", null: false
    t.date "release_date", null: false
    t.integer "price", null: false
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "information", force: :cascade do |t|
    t.string "title", null: false
    t.string "picture", null: false
    t.date "announcement_date", null: false
    t.text "content", null: false
    t.integer "priority", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lives", force: :cascade do |t|
    t.string "place", null: false
    t.string "title", null: false
    t.string "detail", null: false
    t.datetime "open_hour", null: false
    t.datetime "start_hour", null: false
    t.integer "advance_ticket_price", null: false
    t.integer "doors_ticket_price", null: false
    t.datetime "start_time", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "name", null: false
    t.integer "track_number", null: false
    t.integer "cd_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cd_id"], name: "index_songs_on_cd_id"
  end

  add_foreign_key "songs", "cds"
end
