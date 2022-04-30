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

ActiveRecord::Schema[7.0].define(version: 2022_04_30_002137) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_expenses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "style"
    t.string "title"
    t.string "description"
    t.string "source"
    t.float "amount"
    t.string "category"
    t.string "type"
    t.date "date"
    t.integer "req_date"
    t.date "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_business_expenses_on_user_id"
  end

  create_table "business_incomes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "style"
    t.string "title"
    t.string "description"
    t.string "source"
    t.float "amount"
    t.string "category"
    t.date "date"
    t.integer "req_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_business_incomes_on_user_id"
  end

  create_table "business_savings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "style"
    t.string "title"
    t.string "description"
    t.string "source"
    t.float "amount"
    t.string "category"
    t.date "date"
    t.integer "req_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_business_savings_on_user_id"
  end

  create_table "flh_events", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "body"
    t.text "link"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_flh_events_on_user_id"
  end

  create_table "flh_modules", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "description"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_flh_modules_on_user_id"
  end

  create_table "flh_resources_likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "flh_resources_post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flh_resources_post_id"], name: "index_flh_resources_likes_on_flh_resources_post_id"
    t.index ["user_id"], name: "index_flh_resources_likes_on_user_id"
  end

  create_table "flh_resources_posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_flh_resources_posts_on_user_id"
  end

  create_table "flh_society_answers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "flh_society_question_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flh_society_question_id"], name: "index_flh_society_answers_on_flh_society_question_id"
    t.index ["user_id"], name: "index_flh_society_answers_on_user_id"
  end

  create_table "flh_society_likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "flh_society_question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flh_society_question_id"], name: "index_flh_society_likes_on_flh_society_question_id"
    t.index ["user_id"], name: "index_flh_society_likes_on_user_id"
  end

  create_table "flh_society_questions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_flh_society_questions_on_user_id"
  end

  create_table "personal_expenses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "style"
    t.string "title"
    t.string "description"
    t.string "source"
    t.float "amount"
    t.string "category"
    t.string "type"
    t.date "date"
    t.integer "req_date"
    t.date "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_personal_expenses_on_user_id"
  end

  create_table "personal_incomes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "style"
    t.string "title"
    t.string "description"
    t.string "source"
    t.float "amount"
    t.string "category"
    t.date "date"
    t.integer "req_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_personal_incomes_on_user_id"
  end

  create_table "personal_savings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "style"
    t.string "title"
    t.string "description"
    t.string "source"
    t.float "amount"
    t.string "category"
    t.date "date"
    t.integer "req_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_personal_savings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "password_digest"
    t.boolean "is_admin", default: false
    t.boolean "is_advisor", default: false
    t.boolean "is_business", default: false
    t.boolean "is_individual", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "business_expenses", "users"
  add_foreign_key "business_incomes", "users"
  add_foreign_key "business_savings", "users"
  add_foreign_key "flh_events", "users"
  add_foreign_key "flh_modules", "users"
  add_foreign_key "flh_resources_likes", "flh_resources_posts"
  add_foreign_key "flh_resources_likes", "users"
  add_foreign_key "flh_resources_posts", "users"
  add_foreign_key "flh_society_answers", "flh_society_questions"
  add_foreign_key "flh_society_answers", "users"
  add_foreign_key "flh_society_likes", "flh_society_questions"
  add_foreign_key "flh_society_likes", "users"
  add_foreign_key "flh_society_questions", "users"
  add_foreign_key "personal_expenses", "users"
  add_foreign_key "personal_incomes", "users"
  add_foreign_key "personal_savings", "users"
end
