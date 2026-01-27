class CreateMetaInformations < ActiveRecord::Migration[4.2]
  def change
    create_table :meta_informations do |t|
      t.string :title
      t.text :description
      t.string :keywords

      t.timestamps null: false
    end
  end
end
