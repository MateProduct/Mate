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

ActiveRecord::Schema.define(version: 20221213064041) do

  create_table "courses", force: :cascade do |t|
    t.string   "course_no"
    t.string   "uni"
    t.string   "section_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "courses", ["course_no"], name: "index_courses_on_course_no"

  create_table "users", force: :cascade do |t|
    t.string   "uni"
    t.string   "password"
    t.string   "uname"
    t.string   "lionmail"
    t.string   "phone"
    t.string   "contact"
    t.string   "time_slot",       default: ""
    t.text     "description"
    t.text     "skills",          default: ""
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
  end

  add_index "users", ["uni"], name: "index_users_on_uni"

end
