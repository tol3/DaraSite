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

ActiveRecord::Schema.define(version: 20150725183236) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "catagories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "publish",    limit: 1
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "publish",    limit: 1
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "images", force: :cascade do |t|
    t.string   "alt",               limit: 255
    t.string   "hint",              limit: 255
    t.string   "file",              limit: 255
    t.datetime "updated_at"
    t.datetime "created_at"
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
  end

  create_table "news", force: :cascade do |t|
    t.string   "cover",       limit: 255
    t.string   "title",       limit: 255
    t.text     "content",     limit: 65535
    t.boolean  "publish",     limit: 1
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "category_id", limit: 4
    t.string   "post_by",     limit: 255
    t.date     "post_date"
  end

  add_index "news", ["category_id"], name: "index_news_on_category_id", using: :btree

  create_table "parties", force: :cascade do |t|
    t.string   "poster",      limit: 255
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.datetime "day"
    t.string   "location",    limit: 255
    t.string   "party_type",  limit: 255
    t.text     "content",     limit: 65535
    t.text     "party_style", limit: 65535
    t.boolean  "publish",     limit: 1
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "rich_rich_files", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rich_file_file_name",    limit: 255
    t.string   "rich_file_content_type", limit: 255
    t.integer  "rich_file_file_size",    limit: 4
    t.datetime "rich_file_updated_at"
    t.string   "owner_type",             limit: 255
    t.integer  "owner_id",               limit: 4
    t.text     "uri_cache",              limit: 65535
    t.string   "simplified_type",        limit: 255,   default: "file"
  end

end
