# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20180118101203) do

  create_table "audis", force: :cascade do |t|
    t.string  "category",   limit: 255
    t.integer "capacity",   limit: 4
    t.integer "movie_id",   limit: 4
    t.integer "theatre_id", limit: 4
  end

  add_index "audis", ["movie_id"], name: "index_audis_on_movie_id", using: :btree
  add_index "audis", ["theatre_id"], name: "index_audis_on_theatre_id", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.string  "seats_no",       limit: 255
    t.string  "payment_method", limit: 255
    t.integer "user_id",        limit: 4
    t.integer "show_time_id",   limit: 4
  end

  add_index "bookings", ["show_time_id"], name: "index_bookings_on_show_time_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string  "title",    limit: 255
    t.integer "year",     limit: 4
    t.string  "duration", limit: 255
    t.string  "cast",     limit: 255
  end

  create_table "show_times", force: :cascade do |t|
    t.string  "start_time", limit: 255
    t.string  "end_time",   limit: 255
    t.integer "audi_id",    limit: 4
  end

  add_index "show_times", ["audi_id"], name: "index_show_times_on_audi_id", using: :btree

  create_table "theatres", force: :cascade do |t|
    t.string "name",     limit: 255
    t.string "category", limit: 255
    t.string "location", limit: 255
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "number",     limit: 4
    t.integer "booking_id", limit: 4
  end

  add_index "tickets", ["booking_id"], name: "index_tickets_on_booking_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string "name",     limit: 255
    t.string "location", limit: 255
    t.string "phone",    limit: 255
    t.string "email",    limit: 255
  end

  add_foreign_key "audis", "movies"
  add_foreign_key "audis", "theatres"
  add_foreign_key "bookings", "show_times"
  add_foreign_key "bookings", "users"
  add_foreign_key "show_times", "audis"
  add_foreign_key "tickets", "bookings"
end
