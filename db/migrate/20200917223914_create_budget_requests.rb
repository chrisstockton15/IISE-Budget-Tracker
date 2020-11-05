# frozen_string_literal: true

class CreateBudgetRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :budget_requests do |t|
      t.integer :userID
      t.string :eventName
      t.string :accountNumber
      t.string :subAccount
      t.date :requestDate
      t.string :individualName
      t.string :phoneNumber
      t.string :mailingAddress
      t.string :uin
      t.string :paymentType
      t.string :tamuAffilliation
      t.string :travelFormPassowrd
      t.string :requestDescription
      t.string :comments
      t.string :status
      t.float :totalPrice
      t.binary :receiptPicture
      t.timestamps
    end
  end
end
