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

ActiveRecord::Schema.define(:version => 20120518192605) do

  create_table "categories", :force => true do |t|
    t.string   "label"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "category_projects", :force => true do |t|
    t.integer  "category_id"
    t.integer  "project_id"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "category_id"
    t.text     "message"
    t.string   "username"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "comments", ["category_id"], :name => "index_comments_on_category_id"
  add_index "comments", ["project_id"], :name => "index_comments_on_project_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "notes", :force => true do |t|
    t.integer  "project_id"
    t.integer  "category_id"
    t.integer  "value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "notes", ["category_id"], :name => "index_notes_on_category_id"
  add_index "notes", ["project_id"], :name => "index_notes_on_project_id"

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "username"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
