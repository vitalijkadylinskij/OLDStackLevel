class CreateJoinTableCareerTechnology < ActiveRecord::Migration[5.0]
  def change
    create_join_table :careers, :technologies do |t|
      # t.index [:career_id, :technology_id]
      # t.index [:technology_id, :career_id]
      t.belongs_to :career, index: true
      t.belongs_to :technology, index: true
    end
  end
end
