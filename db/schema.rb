# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_25_132120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "company_name"
    t.string "production_capacity"
    t.boolean "pay_for_shipping"
    t.string "payment_condition"
    t.bigint "representative_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["representative_id"], name: "index_clients_on_representative_id"
  end

  create_table "contact_events", force: :cascade do |t|
    t.string "contact_type"
    t.bigint "internal_contact_id", null: false
    t.bigint "client_id", null: false
    t.bigint "representative_id", null: false
    t.datetime "occurred_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_contact_events_on_client_id"
    t.index ["internal_contact_id"], name: "index_contact_events_on_internal_contact_id"
    t.index ["representative_id"], name: "index_contact_events_on_representative_id"
  end

  create_table "internal_contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "role"
    t.string "phone"
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_internal_contacts_on_client_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "contact_event_id", null: false
    t.string "order_type"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_event_id"], name: "index_orders_on_contact_event_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.string "ref_code"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "ref_code"
    t.string "description"
    t.bigint "product_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "clients", "users", column: "representative_id"
  add_foreign_key "contact_events", "clients"
  add_foreign_key "contact_events", "internal_contacts"
  add_foreign_key "contact_events", "users", column: "representative_id"
  add_foreign_key "internal_contacts", "clients"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "contact_events"
  add_foreign_key "products", "product_categories"
end
