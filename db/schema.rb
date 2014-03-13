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

ActiveRecord::Schema.define(version: 20140313223633) do

  create_table "line_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "quantity"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "orders", force: true do |t|
    t.string   "order_status"
    t.string   "payment_method"
    t.string   "delivery_address"
    t.string   "delivery_city"
    t.string   "customer_name"
    t.string   "customer_surname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "product_name"
    t.text     "description"
    t.datetime "added_at"
    t.string   "manufacturer"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
  end

end
