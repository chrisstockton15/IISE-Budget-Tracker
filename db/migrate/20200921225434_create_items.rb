# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.belongs_to :budget_request
      t.integer :requestID
      t.string :itemID
      t.string :description
      t.float :price
      t.integer :quantity
      t.string :type
      t.timestamps
    end
  end
end
