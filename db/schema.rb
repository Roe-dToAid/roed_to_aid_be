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

ActiveRecord::Schema.define(version: 2022_08_26_212045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorized_clinics", force: :cascade do |t|
    t.bigint "state_id"
    t.string "name"
    t.string "city"
    t.string "zip"
    t.string "phone"
    t.string "services"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "source"
    t.index ["state_id"], name: "index_authorized_clinics_on_state_id"
  end

  create_table "misinformation_centers", force: :cascade do |t|
    t.bigint "state_id"
    t.string "name"
    t.string "address"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_misinformation_centers_on_state_id"
  end

  create_table "resources", force: :cascade do |t|
    t.bigint "state_id"
    t.string "name"
    t.string "website"
    t.string "service"
    t.boolean "active"
    t.string "bipoc_focus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_resources_on_state_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.string "legal"
    t.string "legal_description"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "authorized_clinics", "states"
  add_foreign_key "misinformation_centers", "states"
  add_foreign_key "resources", "states"
end
