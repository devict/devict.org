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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131117061013) do

  create_table "challenges", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "submission_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "comments", ["submission_id"], :name => "index_comments_on_submission_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "venue_name"
    t.string   "venue_address"
    t.string   "venue_city"
    t.string   "venue_state"
    t.string   "venue_zip"
    t.string   "date"
    t.string   "url"
    t.string   "photo_url"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "feeds", :force => true do |t|
    t.string   "url",                           :null => false
    t.integer  "user_id"
    t.boolean  "approved",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "irc_users", :force => true do |t|
    t.string "handle"
  end

  add_index "irc_users", ["handle"], :name => "index_irc_users_on_handle"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "summary"
    t.string   "url"
    t.datetime "published_at"
    t.string   "guid"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "feed_id"
  end

  create_table "services", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "uname"
    t.string   "uemail"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "submissions", :force => true do |t|
    t.integer  "challenge_id"
    t.integer  "user_id"
    t.text     "code"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "language",     :default => "Other", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.text     "info"
    t.integer  "permission"
    t.boolean  "isCharter",  :default => false
    t.string   "color",      :default => "#ccc"
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "link"
    t.datetime "published_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "guid"
  end

end
