class CreateHireDevelopers < ActiveRecord::Migration[5.0]
  def change
    create_table :hire_developers do |t|

      t.timestamps
    end
  end
end
