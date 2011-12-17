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

ActiveRecord::Schema.define(:version => 20111217203817) do

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.float    "daylife_score"
    t.text     "excerpt"
    t.text     "headline"
    t.integer  "timestamp_epoch"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content"
  end

  create_table "feeds", :force => true do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.float    "score"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keywords", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_keyword_scores", :force => true do |t|
    t.integer  "user_id"
    t.integer  "keyword_id"
    t.float    "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_source_scores", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "source_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_source_scores", ["source_id"], :name => "user_source_scores_source_id_fk"
  add_index "user_source_scores", ["user_id"], :name => "user_source_scores_user_id_fk"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  add_foreign_key "user_source_scores", "sources", :name => "user_source_scores_source_id_fk"
  add_foreign_key "user_source_scores", "users", :name => "user_source_scores_user_id_fk"

end
