class RemoveColumnsFromCaseStudies < ActiveRecord::Migration[5.0]
  def change
    remove_column :case_studies, :order, :integer
    remove_column :case_studies, :size, :string
    remove_column :case_studies, :project_services, :string
    remove_column :case_studies, :project_industry, :string
    remove_column :case_studies, :project_location, :string
    remove_column :case_studies, :page_bg, :string
    remove_column :case_studies, :page_title, :string
    remove_column :case_studies, :page_subtitle, :string
    remove_column :case_studies, :about_content, :string
    remove_column :case_studies, :solution_title, :string
    remove_column :case_studies, :solution_content, :string
    remove_column :case_studies, :result_title, :string
    remove_column :case_studies, :result_content, :string
    remove_column :case_studies, :review_name, :string
    remove_column :case_studies, :review_position, :string
    remove_column :case_studies, :review_text, :string
    remove_column :case_studies, :quick_facts_team, :string
    remove_column :case_studies, :quick_facts_duration, :string
  end
end
