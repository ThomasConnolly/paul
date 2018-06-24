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

ActiveRecord::Schema.define(version: 2018_06_22_002819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "candidates", force: :cascade do |t|
    t.string "last_name"
    t.string "full_name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link1"
    t.string "link2"
    t.string "link3"
    t.text "links_narrative"
    t.string "link4"
    t.string "photo_link"
  end

  create_table "characteristics", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "definition"
    t.string "kind"
    t.text "question"
    t.index ["user_id"], name: "index_characteristics_on_user_id"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "commentable_id"
    t.string "commentable_type"
  end

  create_table "drop5s", force: :cascade do |t|
    t.integer "pledge"
    t.string "name"
    t.text "how"
    t.string "honey"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "full_name"
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
    t.string "cities", limit: 255
    t.text "background"
    t.text "career"
    t.text "family"
    t.text "lifestyle"
    t.text "civic"
    t.text "church"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", id: :serial, force: :cascade do |t|
    t.integer "survey_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.string "score"
    t.bigint "characteristic_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["characteristic_id"], name: "index_ratings_on_characteristic_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
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

  create_table "search_questions", force: :cascade do |t|
    t.text "question"
    t.bigint "characteristic_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["characteristic_id"], name: "index_search_questions_on_characteristic_id"
    t.index ["user_id"], name: "index_search_questions_on_user_id"
  end

  create_table "search_tasks", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "url"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "sponsorships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "amount", default: 275
    t.string "plan"
    t.string "customer_id"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pay_this"
    t.string "email"
    t.integer "divisor"
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
    t.string "full_name", limit: 255
    t.integer "member_id"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.integer "invited_by_id"
    t.string "invited_by_type"
    t.integer "invitations_count", default: 0
    t.string "customer_id"
    t.string "card"
    t.string "avatar"
    t.string "honey"
    t.string "source"
    t.string "stripe_pledge_id"
    t.string "stripe_sponsorship_id"
    t.string "card_last4"
    t.integer "card_exp_year"
    t.integer "card_exp_month"
    t.string "card_type"
    t.index ["full_name"], name: "index_users_on_full_name"
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
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

  add_foreign_key "characteristics", "users"
  add_foreign_key "ratings", "characteristics"
  add_foreign_key "ratings", "users"
  add_foreign_key "search_questions", "characteristics"
  add_foreign_key "search_questions", "users"
end
