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

ActiveRecord::Schema.define(:version => 20140302030958) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comment_walls", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "user_profile_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "comment_walls", ["user_id"], :name => "index_comment_walls_on_user_id"
  add_index "comment_walls", ["user_profile_id"], :name => "index_comment_walls_on_user_profile_id"

  create_table "followers", :force => true do |t|
    t.integer  "following_id"
    t.integer  "followee_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "followers", ["followee_id"], :name => "index_followers_on_followee_id"
  add_index "followers", ["following_id"], :name => "index_followers_on_following_id"

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.text     "info"
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "image"
  end

  add_index "photos", ["category_id"], :name => "index_photos_on_category_id"
  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "user_profiles", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.text     "description"
    t.string   "job"
    t.boolean  "gender"
    t.date     "birthday"
    t.string   "avatar"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "user_profiles", ["user_id"], :name => "index_user_profiles_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username"

end
