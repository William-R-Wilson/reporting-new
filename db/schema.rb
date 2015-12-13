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

ActiveRecord::Schema.define(version: 20151213142611) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pay_periods", force: true do |t|
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_records", force: true do |t|
    t.integer  "hours"
    t.integer  "vacation"
    t.integer  "sick"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.date     "date"
    t.integer  "holiday"
    t.integer  "inclement_weather"
    t.integer  "bereavement"
    t.integer  "jury_duty"
  end

  add_index "time_records", ["user_id"], name: "index_time_records_on_user_id"

  create_table "transactions", force: true do |t|
    t.date     "date"
    t.string   "vendor"
    t.string   "who"
    t.string   "what"
    t.string   "where"
    t.string   "why"
    t.decimal  "amount",     precision: 6, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "account_id"
    t.integer  "program_id"
  end

  add_index "transactions", ["account_id"], name: "index_transactions_on_account_id"
  add_index "transactions", ["program_id"], name: "index_transactions_on_program_id"
  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                                     default: false
    t.string   "splits"
    t.string   "remember_digest"
    t.decimal  "percent_time"
    t.boolean  "coordinator"
    t.decimal  "accrued_vacation",  precision: 6, scale: 2
    t.decimal  "accrued_sick",      precision: 6, scale: 2
    t.date     "start_date"
    t.boolean  "inactive",                                  default: false
    t.decimal  "starting_sick"
    t.decimal  "starting_vacation"
    t.string   "last_name"
  end

end
