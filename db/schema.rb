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

ActiveRecord::Schema.define(:version => 20141129072437) do

  create_table "equipment", :force => true do |t|
    t.string   "name"
    t.string   "number"
    t.string   "belong_to_institution"
    t.string   "image_link"
    t.datetime "able_start_time"
    t.datetime "able_end_time"
    t.text     "detail"
    t.float    "price"
    t.integer  "count"
    t.boolean  "status"
    t.string   "owner"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "user_id"
  end

  create_table "orders", :force => true do |t|
    t.string   "equipment_name"
    t.string   "equipment_num"
    t.datetime "buy_date"
    t.datetime "use_start_date"
    t.datetime "use_end_date"
    t.boolean  "check_status"
    t.integer  "quantity"
    t.float    "price"
    t.string   "user_name"
    t.boolean  "over_status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "user_id"
    t.integer  "equipment_id"
    t.string   "message"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "email"
    t.string   "phone"
    t.string   "institution"
    t.float    "money"
    t.string   "type"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "remember_token", :limit => nil
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
