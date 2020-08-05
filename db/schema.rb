# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_04_133427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_sales", force: :cascade do |t|
    t.bigint "revenue"
    t.bigint "ikizmet_client_id"
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "total_revenue"
    t.index ["client_id"], name: "index_client_sales_on_client_id", unique: true
    t.index ["ikizmet_client_id"], name: "index_client_sales_on_ikizmet_client_id", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "client_first_name"
    t.string "client_last_name"
    t.bigint "ikizmet_client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ikizmet_client_id"], name: "index_clients_on_ikizmet_client_id", unique: true
  end

  create_table "precalculates", force: :cascade do |t|
    t.string "full_name"
    t.bigint "revenue"
    t.integer "type_list"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "storages", force: :cascade do |t|
    t.json "client_info"
    t.json "client_sales"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "client_sales", "clients"
end
