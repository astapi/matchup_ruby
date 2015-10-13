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

ActiveRecord::Schema.define(version: 20151011064751) do

  create_table "adjust_times", force: :cascade do |t|
    t.datetime "one"
    t.datetime "two"
    t.datetime "three"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_msts", force: :cascade do |t|
    t.integer  "game_mst_id",    limit: 4
    t.string   "character_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "follower_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_msts", force: :cascade do |t|
    t.string   "game_name",  limit: 255
    t.string   "point_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "match_rules", force: :cascade do |t|
    t.integer  "rule_mst_id", limit: 4
    t.integer  "match_count", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "take_user_id",  limit: 4
    t.integer  "game_mst_id",   limit: 4
    t.boolean  "private_flg"
    t.integer  "match_rule_id", limit: 4
    t.datetime "match_time"
    t.text     "streaming_url", limit: 65535
    t.integer  "like_count",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "play_characters", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "character_mst_id", limit: 4
    t.boolean  "main_flg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "play_games", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "game_mst_id", limit: 4
    t.integer  "point",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rule_msts", force: :cascade do |t|
    t.string   "rule",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tmp_matches", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "take_user_id",   limit: 4
    t.integer  "game_mst_id",    limit: 4
    t.boolean  "private_flg"
    t.integer  "match_rule_id",  limit: 4
    t.integer  "adjust_time_id", limit: 4
    t.boolean  "cancel_flg"
    t.text     "cancel_text",    limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "twitter_id",          limit: 8
    t.string   "twitter_screen_name", limit: 255
    t.string   "oauth_token",         limit: 255
    t.string   "oauth_token_secret",  limit: 255
    t.string   "site_token",          limit: 255
    t.datetime "site_token_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
