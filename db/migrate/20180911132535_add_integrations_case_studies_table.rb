class AddIntegrationsCaseStudiesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :case_studies_integrations, id: false do |t|
      t.belongs_to :case_study, index: true
      t.belongs_to :integration, index: true
    end
  end
end
