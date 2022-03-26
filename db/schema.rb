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

ActiveRecord::Schema.define(version: 2022_03_26_194845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "winemakers", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.boolean "public_tasting"
    t.integer "vineyard_acreage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wines", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.date "vintage"
    t.integer "barrels_produced"
    t.boolean "signature_label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "winemaker_id"
    t.index ["winemaker_id"], name: "index_wines_on_winemaker_id"
  end

  add_foreign_key "wines", "winemakers"
end
