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

ActiveRecord::Schema.define(version: 20160924225116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "medications", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "insurance_plan_number"
    t.string   "insurance_type"
    t.string   "insurance_name"
    t.integer  "cost_per_month_before_gap"
    t.integer  "cost_per_month_during_gap"
    t.integer  "cost_per_month_after_gap"
    t.integer  "months_before_gap"
    t.integer  "months_during_gap"
    t.integer  "months_after_gap"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
