class CreateJoinTableCaseStudyBusinessDomain < ActiveRecord::Migration[5.0]
  def change
    create_join_table :case_studies, :business_domains do |t|
      # t.index [:case_study_id, :business_domain_id]
      # t.index [:business_domain_id, :case_study_id]
      t.belongs_to :case_study, index: true
      t.belongs_to :business_domain, index: true
    end
  end
end
