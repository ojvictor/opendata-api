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

ActiveRecord::Schema.define(version: 2023_10_12_201244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analyses", force: :cascade do |t|
    t.boolean "false_positive"
    t.date "analysis_date"
    t.bigint "page_id"
    t.bigint "dw_best_pratice_id"
    t.bigint "open_gov_principle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dw_best_pratice_id"], name: "index_analyses_on_dw_best_pratice_id"
    t.index ["open_gov_principle_id"], name: "index_analyses_on_open_gov_principle_id"
    t.index ["page_id"], name: "index_analyses_on_page_id"
  end

  create_table "dw_best_pratices", force: :cascade do |t|
    t.boolean "metadata"
    t.boolean "version"
    t.boolean "license"
    t.bigint "page_id"
    t.bigint "open_gov_principle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["open_gov_principle_id"], name: "index_dw_best_pratices_on_open_gov_principle_id"
    t.index ["page_id"], name: "index_dw_best_pratices_on_page_id"
  end

  create_table "open_gov_principles", force: :cascade do |t|
    t.boolean "complete"
    t.boolean "primary"
    t.boolean "accessible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "page_id"
    t.index ["page_id"], name: "index_open_gov_principles_on_page_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "analyses", "dw_best_pratices"
  add_foreign_key "analyses", "open_gov_principles"
  add_foreign_key "analyses", "pages"
  add_foreign_key "dw_best_pratices", "open_gov_principles"
  add_foreign_key "dw_best_pratices", "pages"
  add_foreign_key "open_gov_principles", "pages"
end
