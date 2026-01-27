class AddAdditionalFieldsToCaseStudies < ActiveRecord::Migration[5.0]
  def change
    add_column :case_studies, :locale, :string
    add_column :case_studies, :order, :integer
    add_column :case_studies, :size, :string
    add_column :case_studies, :path_name, :string
    add_column :case_studies, :project_bg, :string
    add_column :case_studies, :project_title, :string
    add_column :case_studies, :project_services, :string
    add_column :case_studies, :project_industry, :string
    add_column :case_studies, :project_location, :string
    add_column :case_studies, :page_bg, :string
    add_column :case_studies, :page_title, :string
    add_column :case_studies, :page_subtitle, :string
    add_column :case_studies, :about_title, :string
    add_column :case_studies, :about_content, :string
    add_column :case_studies, :solution_title, :string
    add_column :case_studies, :solution_content, :string
    add_column :case_studies, :result_title, :string
    add_column :case_studies, :result_content, :string
    add_column :case_studies, :review_name, :string
    add_column :case_studies, :review_photo, :string
    add_column :case_studies, :review_position, :string
    add_column :case_studies, :review_text, :string
    add_column :case_studies, :quick_facts_team, :string
    add_column :case_studies, :quick_facts_duration, :string
  end
end
