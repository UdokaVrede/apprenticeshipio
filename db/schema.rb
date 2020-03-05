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

ActiveRecord::Schema.define(version: 2020_03_05_142756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apprentices", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "race"
    t.string "gender"
    t.string "previous_career"
    t.string "linkedin_url"
    t.string "photo_url"
    t.datetime "date_started"
    t.datetime "date_ended"
    t.boolean "converted"
    t.string "current_title"
    t.string "current_company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved_to_publish"
    t.boolean "podcast_recorded"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "size"
    t.integer "salary"
    t.datetime "upcoming_cohort"
    t.integer "number_of_apprentices"
    t.integer "number_of_cohorts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.string "apprenticeship_location"
    t.string "company_url"
    t.string "apprenticeship_url"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_founded"
    t.boolean "currently_operating"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "cost"
    t.string "type"
    t.integer "duration"
    t.string "field"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_founded"
    t.boolean "currently_operating"
  end

end
