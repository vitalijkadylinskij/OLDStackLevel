class CreateJoinTableHireDeveloperFramework < ActiveRecord::Migration[5.0]
  def change
    create_join_table :hire_developers, :frameworks do |t|
      # t.index [:hire_developer_id, :framework_id]
      # t.index [:framework_id, :hire_developer_id]
      t.belongs_to :hire_developer, index: true
      t.belongs_to :framework, index: true
    end
  end
end
