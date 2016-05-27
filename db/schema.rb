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

ActiveRecord::Schema.define(version: 20160508063814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoices", force: true do |t|
    t.date     "date"
    t.string   "invoice_number"
    t.string   "customer"
    t.string   "products"
    t.decimal  "total",          precision: 15, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_number"
    t.string   "email_id"
  end

  create_table "productinvoices", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
    t.integer  "invoice_id"
  end

  create_table "products", force: true do |t|
    t.string   "product_name"
    t.integer  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
