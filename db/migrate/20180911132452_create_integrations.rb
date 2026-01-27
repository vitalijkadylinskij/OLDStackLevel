class CreateIntegrations < ActiveRecord::Migration[5.0]
  def change
    create_table :integrations do |t|
      t.string :name
      t.string :alias_name
      t.string :logo
    end
  end
end
