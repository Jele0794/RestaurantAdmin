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

ActiveRecord::Schema.define(version: 20161108224932) do

  create_table "ingredient_per_meals", force: :cascade do |t|
    t.integer  "meal_id",              limit: 4
    t.integer  "ingredient_id",        limit: 4
    t.float    "amount_of_ingredient", limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredient_per_meals", ["ingredient_id"], name: "index_ingredient_per_meals_on_ingredient_id", using: :btree
  add_index "ingredient_per_meals", ["meal_id"], name: "index_ingredient_per_meals_on_meal_id", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.text     "descripcion", limit: 65535
    t.float    "cantidad",    limit: 24
    t.string   "unidad",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meals", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.text     "descripcion", limit: 65535
    t.float    "precio",      limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer  "order_id",           limit: 4
    t.integer  "meal_id",            limit: 4
    t.integer  "amount_of_meals",    limit: 4,  default: 1
    t.float    "subtotal_per_meals", limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_details", ["meal_id"], name: "index_order_details_on_meal_id", using: :btree
  add_index "order_details", ["order_id"], name: "index_order_details_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "status",     limit: 4,  default: 0
    t.float    "total",      limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
