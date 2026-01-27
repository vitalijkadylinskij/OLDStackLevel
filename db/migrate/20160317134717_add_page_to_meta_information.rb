class AddPageToMetaInformation < ActiveRecord::Migration[4.2]
  def change
    add_column :meta_informations, :page, :string
  end
end
