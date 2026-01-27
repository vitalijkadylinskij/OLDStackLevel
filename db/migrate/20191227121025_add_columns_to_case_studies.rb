class AddColumnsToCaseStudies < ActiveRecord::Migration[5.0]
  def change
    add_column :case_studies, :business_case_description, :string
    add_column :case_studies, :developted_solution_description, :string
    add_column :case_studies, :first_solution, :string
    add_column :case_studies, :second_solution, :string
    add_column :case_studies, :third_solution, :string
  end
end
