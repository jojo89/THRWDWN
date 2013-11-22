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

ActiveRecord::Schema.define(version: 20131121184310) do

  create_table "games", force: true do |t|
    t.boolean  "ended"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rolls", force: true do |t|
    t.integer  "points"
    t.integer  "score_id"
    t.integer  "dice_1"
    t.integer  "dice_2"
    t.integer  "dice_3"
    t.integer  "dice_4"
    t.integer  "dice_5"
    t.integer  "dice_6"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.string   "name"
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end