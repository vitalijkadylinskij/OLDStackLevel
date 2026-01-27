class AddHireDevelopersTechnologiesJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :hire_developers_technologies, id: false do |t|
      t.belongs_to :hire_developer, index: true
      t.belongs_to :technology, index: true
    end
  end
end
