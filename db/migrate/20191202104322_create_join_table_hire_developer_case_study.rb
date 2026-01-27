class CreateJoinTableHireDeveloperCaseStudy < ActiveRecord::Migration[5.0]
  def change
    create_join_table :hire_developers, :case_studies do |t|
      # t.index [:hire_developer_id, :case_study_id]
      # t.index [:case_study_id, :hire_developer_id]
      t.belongs_to :hire_developer, index: true
      t.belongs_to :case_study, index: true
    end
  end
end
