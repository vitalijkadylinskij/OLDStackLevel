class AddEmailAndNameToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :email, :string
    add_index :users, :email
    add_column :users, :name, :string
  end
end
