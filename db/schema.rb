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

ActiveRecord::Schema.define(version: 20150531022711) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.string   "name",           limit: 255
    t.string   "provice",        limit: 255
    t.string   "city",           limit: 255
    t.string   "detail_address", limit: 255
    t.string   "postal_code",    limit: 255
    t.string   "phone",          limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "branches", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "contact",    limit: 255
    t.decimal  "lng",                    precision: 10
    t.decimal  "lat",                    precision: 10
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "icon",       limit: 255
    t.integer  "position",   limit: 4
    t.text     "desc",       limit: 65535
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "province_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "lb_brands", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "water_type", limit: 255
    t.string   "icon",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "desc",       limit: 65535
    t.integer  "position",   limit: 4
  end

  create_table "lb_coupons", force: :cascade do |t|
    t.integer  "product_id",     limit: 4
    t.integer  "count",          limit: 4
    t.integer  "price",          limit: 4
    t.integer  "remain_count",   limit: 4
    t.integer  "user_id",        limit: 4
    t.string   "coupon_type",    limit: 255
    t.string   "prepare_id",     limit: 255
    t.string   "transaction_id", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "lb_orders", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "coupon_id",        limit: 4
    t.string   "product_id",       limit: 255
    t.integer  "quantity",         limit: 4
    t.integer  "staff_id",         limit: 4
    t.string   "status",           limit: 255
    t.boolean  "delay",            limit: 1
    t.datetime "deliver_begin_at"
    t.datetime "reached_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "lb_products", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "brand_id",     limit: 4
    t.integer  "coupon_count", limit: 4
    t.integer  "reward_count", limit: 4
    t.string   "water_type",   limit: 255
    t.integer  "price",        limit: 4
    t.text     "desc",         limit: 65535
    t.string   "icon",         limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "position",     limit: 4
  end

  create_table "lb_user_brands", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "brand_id",   limit: 4
    t.boolean  "highlight",  limit: 1
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "o2o_settings", force: :cascade do |t|
    t.string   "var",        limit: 255
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.integer  "product_id", limit: 4
    t.integer  "quantity",   limit: 4
    t.integer  "price",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "total_price",    limit: 4
    t.string   "order_status",   limit: 255
    t.string   "ship_status",    limit: 255
    t.string   "payment_status", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "price",       limit: 4
    t.string   "sku",         limit: 255
    t.text     "desc",        limit: 65535
    t.integer  "quantity",    limit: 4
    t.string   "pic1",        limit: 255
    t.string   "pic2",        limit: 255
    t.string   "pic3",        limit: 255
    t.string   "pic4",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "category_id", limit: 4
    t.string   "pinyin",      limit: 255
  end

  create_table "provices", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "shipments", force: :cascade do |t|
    t.integer  "address_id", limit: 4
    t.integer  "order_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "branch_id",          limit: 4
    t.string   "login",              limit: 255
    t.string   "encrypted_password", limit: 255
    t.string   "salt",               limit: 255
    t.string   "avatar",             limit: 255
    t.string   "last_login_ip",      limit: 255
    t.datetime "last_login_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "category_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "login",              limit: 255
    t.string   "name",               limit: 255
    t.string   "salt",               limit: 255
    t.string   "encrypted_password", limit: 255
    t.string   "last_login_at",      limit: 255
    t.string   "last_login_ip",      limit: 255
    t.string   "source",             limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
