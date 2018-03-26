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

ActiveRecord::Schema.define(version: 20180326173345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_fields", force: :cascade do |t|
    t.string "value"
    t.string "name"
    t.bigint "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_fields_on_card_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "due_date"
    t.bigint "pipe_id"
    t.bigint "phase_field_id"
    t.datetime "updated_at", null: false
    t.index ["phase_field_id"], name: "index_cards_on_phase_field_id"
    t.index ["pipe_id"], name: "index_cards_on_pipe_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string "value"
    t.string "name"
    t.bigint "pipe_id"
    t.bigint "phase_field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phase_field_id"], name: "index_fields_on_phase_field_id"
    t.index ["pipe_id"], name: "index_fields_on_pipe_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phase_fields", force: :cascade do |t|
    t.string "name"
    t.bigint "pipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pipe_id"], name: "index_phase_fields_on_pipe_id"
  end

  create_table "pipes", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_pipes_on_organization_id"
  end

  add_foreign_key "card_fields", "cards"
  add_foreign_key "cards", "phase_fields"
  add_foreign_key "cards", "pipes"
  add_foreign_key "fields", "phase_fields"
  add_foreign_key "fields", "pipes"
  add_foreign_key "phase_fields", "pipes"
  add_foreign_key "pipes", "organizations"
end
