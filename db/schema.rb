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

ActiveRecord::Schema.define(version: 20170221201804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anniversaries", force: :cascade do |t|
    t.string   "salutation"
    t.string   "last_name"
    t.date     "anniversary"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.integer  "attachinariable_id"
    t.string   "attachinariable_type"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachinary_files", ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "author",     limit: 255
    t.string   "title",      limit: 255
    t.string   "subject",    limit: 255
    t.string   "isbn",       limit: 255
    t.string   "dewey",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "commentable_id"
    t.string   "commentable_type"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.integer  "price"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
    t.integer  "amount"
    t.string   "url"
    t.time     "time"
  end

  create_table "formation_talks", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.date     "delivered_on"
  end

  create_table "homilists", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "title",      limit: 255
    t.string   "photo",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jubilee_plans", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "meditations", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "scripture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "prayer"
    t.date     "publish_on"
    t.string   "honey"
  end

  create_table "members", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "email"
    t.date     "birthday"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "membership_id"
    t.string   "full_name"
  end

  create_table "opportunities", force: :cascade do |t|
    t.string   "ministry",   limit: 255
    t.string   "who",        limit: 255
    t.string   "what",       limit: 255
    t.string   "when",       limit: 255
    t.string   "where",      limit: 255
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pledges", force: :cascade do |t|
    t.integer  "divisor"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount"
    t.integer  "pay_this"
    t.string   "plan"
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "cities",     limit: 255
    t.text     "background"
    t.text     "career"
    t.text     "family"
    t.text     "lifestyle"
    t.text     "civic"
    t.text     "church"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "survey_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sermons", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "cites",        limit: 255
    t.text     "sermon_body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "homilist_id"
    t.date     "delivered_on"
  end

  create_table "story_ideas", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
  end

  create_table "syllabuses", force: :cascade do |t|
    t.string   "year"
    t.string   "grade"
    t.string   "title1"
    t.string   "title2"
    t.string   "title3"
    t.string   "title4"
    t.string   "title5"
    t.string   "title6"
    t.string   "title7"
    t.string   "title8"
    t.string   "title9"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "theme"
    t.integer  "quarter"
  end

  create_table "tasks", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title",       null: false
    t.text     "description"
    t.string   "deadline",    null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.decimal  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "event_id"
    t.integer  "quantity"
    t.integer  "amount"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "card"
    t.string   "customer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "full_name",              limit: 255
    t.integer  "member_id"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",                  default: 0
    t.string   "customer_id"
    t.string   "card"
  end

  add_index "users", ["full_name"], name: "index_users_on_full_name", using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "vestry_minutes", force: :cascade do |t|
    t.date     "date"
    t.text     "minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vreports", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
