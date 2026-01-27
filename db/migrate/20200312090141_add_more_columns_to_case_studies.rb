class AddMoreColumnsToCaseStudies < ActiveRecord::Migration[5.0]
  def change
    add_column :case_studies, :business_challenge, :string
    add_column :case_studies, :proud_of, :string
    add_column :case_studies, :result, :string
    add_column :case_studies, :section, :string
    add_column :case_studies, :technology, :string
    add_column :case_studies, :duration, :string
    add_column :case_studies, :team, :string
    add_column :case_studies, :customer, :string
  end
end
