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

ActiveRecord::Schema.define(version: 20200924014252) do

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
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
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

end
