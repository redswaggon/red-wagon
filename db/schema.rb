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

ActiveRecord::Schema.define(version: 20131118205653) do

  create_table "items", force: true do |t|
    t.string   "name"
    t.integer  "wagon_id"
    t.string   "photo_file_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["wagon_id"], name: "index_items_on_wagon_id"

  create_table "likes", force: true do |t|
    t.integer  "wagon_id"
    t.integer  "liked_wagon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "neighborhoods", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "neighborhoods_wagons", force: true do |t|
    t.integer "neighborhood_id"
    t.integer "wagon_id"
  end

  create_table "wagons", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
