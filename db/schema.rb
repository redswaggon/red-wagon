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

ActiveRecord::Schema.define(version: 20131125193855) do

  create_table "chats", force: true do |t|
    t.integer "user_id"
    t.integer "chatted_user_id"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id"

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "liked_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer "chat_id"
    t.string  "content"
    t.integer "from"
    t.integer "to"
  end

  create_table "neighborhoods", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "neighborhoods_users", force: true do |t|
    t.integer "neighborhood_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
  end

end
