class RenameRequestsTable < ActiveRecord::Migration[5.0]
  def up
    rename_table :requests, :order_requests
  end

  def down
    rename_table :order_requests, :requests
  end
end
