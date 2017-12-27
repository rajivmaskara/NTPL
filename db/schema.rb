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

ActiveRecord::Schema.define(version: 20171113170750) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "customer_name"
    t.integer  "phone_no"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_products", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "order_quantity"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_rates", force: true do |t|
    t.integer  "order_id"
    t.integer  "category_id"
    t.integer  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "order_number"
    t.date     "order_date"
    t.float    "total"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sauda_id"
  end

  create_table "products", force: true do |t|
    t.string   "size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  create_table "sauda_line_items", force: true do |t|
    t.integer  "category_id"
    t.float    "rate"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sauda_id"
  end

  create_table "saudas", force: true do |t|
    t.string   "sauda_number"
    t.date     "sauda_date"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_order_taken", default: false
    t.boolean  "is_delivered",   default: false
  end

end
