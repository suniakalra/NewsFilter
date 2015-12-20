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

ActiveRecord::Schema.define(version: 20151128125703) do

  create_table "sea_ports", force: :cascade do |t|
    t.string   "starting_port_name", limit: 255
    t.string   "reached_port_name",  limit: 255
    t.boolean  "is_reached",                     default: false
    t.string   "description",        limit: 255
    t.string   "vessel_name",        limit: 255
    t.integer  "vessel_imo_no",      limit: 4
    t.integer  "vessel_id",          limit: 4
    t.string   "captain_name",       limit: 255
    t.string   "chief_engineer",     limit: 255
    t.string   "zone_time",          limit: 255
    t.string   "smt_time",           limit: 255
    t.integer  "total_reports",      limit: 4,   default: 0
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "sea_reports", force: :cascade do |t|
    t.boolean  "is_closed",                                     default: false
    t.string   "closed_time_in_smt", limit: 255
    t.datetime "closed_time_in_utc"
    t.string   "opened_time_in_smt", limit: 255
    t.integer  "report_number",      limit: 4
    t.integer  "integer",            limit: 4
    t.integer  "sea_port_id",        limit: 4
    t.string   "zone_time",          limit: 255
    t.decimal  "report_interval",                precision: 10
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  create_table "users", force: :cascade do |t|
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
