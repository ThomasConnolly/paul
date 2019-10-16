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

ActiveRecord::Schema.define(version: 2019_10_14_165627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "albergue_donations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "plan", default: "plan_EU0tm2nqfqXFYj"
    t.boolean "anonymous", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "child_name"
    t.index ["user_id"], name: "index_albergue_donations_on_user_id"
  end

  create_table "anniversaries", id: :serial, force: :cascade do |t|
    t.string "salutation"
    t.string "last_name"
    t.date "anniversary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attachinary_files", id: :serial, force: :cascade do |t|
    t.integer "attachinariable_id"
    t.string "attachinariable_type"
    t.string "scope"
    t.string "public_id"
    t.string "version"
    t.integer "width"
    t.integer "height"
    t.string "format"
    t.string "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"
  end

  create_table "books", id: :serial, force: :cascade do |t|
    t.string "author", limit: 255
    t.string "title", limit: 255
    t.string "subject", limit: 255
    t.string "isbn", limit: 255
    t.string "dewey", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "description"
    t.string "cutter"
    t.string "url"
    t.index ["author", "title"], name: "index_books_on_author_and_title"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "commentable_id"
    t.string "commentable_type"
  end

  create_table "donations", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "anonymous", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_email"
    t.string "plan"
    t.string "stripe_plan"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.integer "amount"
    t.string "url"
    t.string "time"
  end

  create_table "formation_talks", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "delivered_on"
  end

  create_table "homilists", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "title", limit: 255
    t.string "photo", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jubilee_plans", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "letters", force: :cascade do |t|
    t.string "salutation"
    t.string "last_name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "writer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marriage_talks", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.date "delivered_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meditations", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "scripture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "prayer"
    t.date "publish_on"
    t.string "honey"
  end

  create_table "members", id: :serial, force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "email"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "membership_id"
    t.string "username"
    t.string "away_zip"
  end

  create_table "opportunities", id: :serial, force: :cascade do |t|
    t.string "ministry", limit: 255
    t.string "who", limit: 255
    t.string "what", limit: 255
    t.string "when", limit: 255
    t.string "where", limit: 255
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pledges", id: :serial, force: :cascade do |t|
    t.integer "divisor"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "amount"
    t.integer "pay_this"
    t.string "plan"
    t.string "subscription_id"
    t.integer "interval"
    t.integer "interval_count"
    t.integer "status"
    t.date "start_date"
    t.date "end_date"
    t.string "product", default: "prod_ETteQ8s9Ho9sNW"
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
  end

  create_table "prayers", id: :serial, force: :cascade do |t|
    t.string "day_of_prayer"
    t.string "time_of_prayer"
    t.string "name"
    t.string "honey"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pray_time"
  end

  create_table "profiles", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.text "cities"
    t.text "background"
    t.text "career"
    t.text "family"
    t.text "lifestyle"
    t.text "civic"
    t.text "church"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "resource_id"
    t.string "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
  end

  create_table "sermons", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.string "cites", limit: 255
    t.text "sermon_body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "homilist_id"
    t.date "delivered_on"
    t.string "audio"
  end

  create_table "story_ideas", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "syllabuses", id: :serial, force: :cascade do |t|
    t.string "year"
    t.string "grade"
    t.string "title1"
    t.string "title2"
    t.string "title3"
    t.string "title4"
    t.string "title5"
    t.string "title6"
    t.string "title7"
    t.string "title8"
    t.string "title9"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "theme"
    t.integer "quarter"
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", null: false
    t.text "description"
    t.string "deadline", null: false
  end

  create_table "tickets", id: :serial, force: :cascade do |t|
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
    t.integer "quantity"
    t.integer "amount"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "customer_id"
    t.string "source"
    t.string "honey"
    t.index ["event_id"], name: "index_tickets_on_event_id"
  end

  create_table "todo_lists", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "username", limit: 255
    t.string "stripe_customer_id"
    t.string "card"
    t.string "avatar"
    t.string "honey"
    t.string "source"
    t.string "albergue_sponsor"
    t.string "card_last4"
    t.integer "card_exp_year"
    t.integer "card_exp_month"
    t.string "card_type"
    t.integer "donation_id"
    t.string "stripe_pledge"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
  end

  create_table "vestry_minutes", id: :serial, force: :cascade do |t|
    t.date "date"
    t.text "minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vreports", id: :serial, force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "works", force: :cascade do |t|
    t.string "my_act"
    t.string "honey"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "albergue_donations", "users"
  add_foreign_key "donations", "users"
end
