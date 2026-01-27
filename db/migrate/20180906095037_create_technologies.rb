class CreateTechnologies < ActiveRecord::Migration[5.0]
  def change
    create_table :technologies do |t|
      t.string :name
      t.string :alias_name
      t.string :logo
    end
  end
end
