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

ActiveRecord::Schema.define(version: 20170307091337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "body"
    t.string   "slug"
    t.index ["slug"], name: "index_categories_on_slug", unique: true, using: :btree
    t.index ["title"], name: "index_categories_on_title", unique: true, using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "title",                                   default: "",    null: false
    t.text     "body"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "user_id"
    t.integer  "quantity",                                default: 0,     null: false
    t.integer  "category_id"
    t.decimal  "price",          precision: 10, scale: 2, default: "0.0", null: false
    t.integer  "status",                                  default: 0,     null: false
    t.string   "slug"
    t.decimal  "weight",         precision: 10, scale: 2, default: "0.0"
    t.decimal  "width",          precision: 10, scale: 2, default: "0.0"
    t.decimal  "height",         precision: 10, scale: 2, default: "0.0"
    t.decimal  "length",         precision: 10, scale: 2, default: "0.0"
    t.integer  "visit_times",                             default: 0
    t.integer  "total_sold",                              default: 0
    t.decimal  "average_rating", precision: 2,  scale: 1, default: "0.0"
    t.integer  "total_ratings",                           default: 0
    t.integer  "total_reviews",                           default: 0
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["slug"], name: "index_items_on_slug", unique: true, using: :btree
    t.index ["title"], name: "index_items_on_title", unique: true, using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "body",       null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 10, scale: 2, default: "0.0", null: false
    t.integer  "quantity",                             default: 0,     null: false
    t.decimal  "total_price", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.decimal  "weight",      precision: 10, scale: 2, default: "0.0"
    t.decimal  "width",       precision: 10, scale: 2, default: "0.0"
    t.decimal  "height",      precision: 10, scale: 2, default: "0.0"
    t.decimal  "length",      precision: 10, scale: 2, default: "0.0"
    t.index ["item_id"], name: "index_order_items_on_item_id", using: :btree
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "order_status_id"
    t.decimal  "tax",                 precision: 10, scale: 2, default: "0.0", null: false
    t.decimal  "order_total",         precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.integer  "shipping_id",                                  default: 0
    t.decimal  "item_total",          precision: 10, scale: 2, default: "0.0"
    t.integer  "item_total_quantity",                          default: 0
    t.decimal  "total_weight",        precision: 10, scale: 2, default: "0.0"
    t.decimal  "total_width",         precision: 10, scale: 2, default: "0.0"
    t.decimal  "total_height",        precision: 10, scale: 2, default: "0.0"
    t.decimal  "total_length",        precision: 10, scale: 2, default: "0.0"
    t.index ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
    t.index ["shipping_id"], name: "index_orders_on_shipping_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.string   "searchable_type"
    t.integer  "searchable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating",     null: false
    t.string   "body"
    t.integer  "user_id",    null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_reviews_on_item_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "shippings", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.decimal  "price",      precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                           default: "",    null: false
    t.string   "encrypted_password",                              default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                                 default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.date     "birthday"
    t.string   "slug"
    t.integer  "role",                                            default: 0,     null: false
    t.date     "last_time_login"
    t.decimal  "total_spend",            precision: 10, scale: 2, default: "0.0"
    t.integer  "total_orders",                                    default: 0
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "wish_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_wish_lists_on_item_id", using: :btree
    t.index ["user_id"], name: "index_wish_lists_on_user_id", using: :btree
  end

  add_foreign_key "items", "categories"
  add_foreign_key "messages", "users"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "order_statuses"
  add_foreign_key "orders", "shippings"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "items"
  add_foreign_key "reviews", "users"
  add_foreign_key "wish_lists", "items"
  add_foreign_key "wish_lists", "users"
end
