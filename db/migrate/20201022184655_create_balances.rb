class CreateBalances < ActiveRecord::Migration[6.0]
  def change
    create_table :balances do |t|
	  t.float :balanceAmount
	  
      t.timestamps
    end
  end
end
