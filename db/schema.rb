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

ActiveRecord::Schema[7.0].define(version: 2023_02_02_124603) do
  create_table "ballots", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.integer "election_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["election_id"], name: "index_ballots_on_election_id"
  end

  create_table "elections", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "value"
    t.integer "ballot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ballot_id"], name: "index_options_on_ballot_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.integer "voter_id", null: false
    t.integer "election_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["election_id"], name: "index_registrations_on_election_id"
    t.index ["voter_id"], name: "index_registrations_on_voter_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "ballot_id", null: false
    t.text "value"
    t.integer "option_id"
    t.integer "voter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ballot_id"], name: "index_responses_on_ballot_id"
    t.index ["option_id"], name: "index_responses_on_option_id"
    t.index ["voter_id"], name: "index_responses_on_voter_id"
  end

  create_table "voters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ballots", "elections"
  add_foreign_key "options", "ballots"
  add_foreign_key "registrations", "elections"
  add_foreign_key "registrations", "voters"
  add_foreign_key "responses", "ballots"
  add_foreign_key "responses", "options"
  add_foreign_key "responses", "voters"
end
