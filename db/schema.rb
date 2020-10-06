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

ActiveRecord::Schema.define(version: 2020_09_25_043338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budget_requests", force: :cascade do |t|
    t.integer "userID"
    t.string "eventName"
    t.string "accountNumber"
    t.string "subAccount"
    t.date "requestDate"
    t.string "individualName"
    t.string "phoneNumber"
    t.string "mailingAddress"
    t.string "uin"
    t.string "paymentType"
    t.string "tamuAffilliation"
    t.string "travelFormPassowrd"
    t.string "requestDescription"
    t.string "comments"
    t.string "status"
    t.float "totalPrice"
    t.binary "receiptPicture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.bigint "budget_request_id"
    t.integer "requestID"
    t.string "itemID"
    t.string "description"
    t.float "price"
    t.integer "quantity"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_request_id"], name: "index_items_on_budget_request_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "budget_request_id"
    t.string "description"
    t.float "price"
    t.integer "quantity"
    t.string "expense_type"
    t.string "permalink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_request_id"], name: "index_products_on_budget_request_id"
    t.index ["permalink"], name: "index_products_on_permalink"
  end

end
