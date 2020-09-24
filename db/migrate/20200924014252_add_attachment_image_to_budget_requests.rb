class AddAttachmentImageToBudgetRequests < ActiveRecord::Migration[5.1]
  def self.up
    change_table :budget_requests do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :budget_requests, :image
  end
end
