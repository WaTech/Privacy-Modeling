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

ActiveRecord::Schema.define(version: 20160919144733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "context_items", force: :cascade do |t|
    t.integer  "rule_id"
    t.integer  "category"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["rule_id"], name: "index_context_items_on_rule_id", using: :btree
  end

  create_table "personal_information_items", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rules", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "personal_information_item_id"
    t.integer  "use_item_id"
    t.integer  "restriction"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["category_id"], name: "index_rules_on_category_id", using: :btree
    t.index ["personal_information_item_id"], name: "index_rules_on_personal_information_item_id", using: :btree
    t.index ["use_item_id"], name: "index_rules_on_use_item_id", using: :btree
  end

  create_table "use_items", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "context_items", "rules"
  add_foreign_key "rules", "categories"
  add_foreign_key "rules", "personal_information_items"
  add_foreign_key "rules", "use_items"
end