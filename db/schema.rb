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

ActiveRecord::Schema.define(:version => 20110803035915) do

  create_table "sheets", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_markdown"
  end

  create_table "tags", :primary_key => "tag_id", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "password_hash"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_logins",         :default => 0
    t.datetime "session_started_at"
    t.integer  "score",              :default => 0
  end

end
