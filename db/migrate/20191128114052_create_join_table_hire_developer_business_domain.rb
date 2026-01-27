class CreateJoinTableHireDeveloperBusinessDomain < ActiveRecord::Migration[5.0]
  def change
    create_join_table :hire_developers, :business_domains do |t|
      # t.index [:hire_developer_id, :business_domain_id]
      # t.index [:business_domain_id, :hire_developer_id]
      t.belongs_to :hire_developer, index: true
      t.belongs_to :business_domain, index: true
    end
  end
end
