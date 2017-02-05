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



ActiveRecord::Schema.define(version: 20170205210209) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apikeys", force: :cascade do |t|
    t.string   "access_token"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "equips", force: :cascade do |t|
    t.integer  "owner_id"
    t.integer  "lootable_id"
    t.string   "lootable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "equips", ["lootable_type", "lootable_id"], name: "index_equips_on_lootable_type_and_lootable_id", using: :btree

  create_table "errands", force: :cascade do |t|
    t.string   "task",       null: false
    t.string   "lat",        null: false
    t.string   "lng",        null: false
    t.integer  "quest_id",   null: false
    t.integer  "hero_id",    null: false
    t.integer  "npc_id",     null: false
    t.integer  "completed",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "errands", ["lat"], name: "index_errands_on_lat", using: :btree
  add_index "errands", ["lng"], name: "index_errands_on_lng", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "slot"
    t.integer  "rarity"
    t.string   "image_url"
    t.string   "description"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "npcs", force: :cascade do |t|
    t.string   "avatar_url"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "npcs", ["avatar_url"], name: "index_npcs_on_avatar_url", using: :btree
  add_index "npcs", ["name"], name: "index_npcs_on_name", using: :btree

  create_table "quests", force: :cascade do |t|
    t.string   "hook"
    t.text     "description"
    t.string   "icon_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "quests", ["hook"], name: "index_quests_on_hook", using: :btree
  add_index "quests", ["icon_url"], name: "index_quests_on_icon_url", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",         null: false
    t.string   "email",            null: false
    t.string   "avatar_url",       null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "auth_token"
    t.datetime "token_created_at"
    t.string   "password_digest"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
