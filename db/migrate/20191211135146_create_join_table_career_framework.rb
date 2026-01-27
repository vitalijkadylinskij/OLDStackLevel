class CreateJoinTableCareerFramework < ActiveRecord::Migration[5.0]
  def change
    create_join_table :careers, :frameworks do |t|
      # t.index [:career_id, :framework_id]
      # t.index [:framework_id, :career_id]
      t.belongs_to :career, index: true
      t.belongs_to :framework, index: true
    end
  end
end
