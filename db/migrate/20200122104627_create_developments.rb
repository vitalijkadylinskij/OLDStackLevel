class CreateDevelopments < ActiveRecord::Migration[5.0]
  def change
    create_table :developments do |t|
      t.string :title
      t.string :path_name
      t.string :description
      t.string :sub_description
      t.string :what_is
      t.string :where_to_use_title
      t.string :where_to_use_cases
      t.string :why_reasons
      t.string :what_can_we_do
      t.string :locale

      t.timestamps
    end
  end
end
