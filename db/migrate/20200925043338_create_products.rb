class CreateProducts < ActiveRecord::Migration[5.1]
  def up
    create_table :products do |t|
      t.integer :budget_request_id
      t.string :description
      t.float :price
      t.integer :quantity
      t.string :expense_type
      t.string :permalink
      t.timestamps
    end
    add_index("products", "budget_request_id")
    add_index("products", "permalink")
  end

  def down
    drop_table :products
  end

end
