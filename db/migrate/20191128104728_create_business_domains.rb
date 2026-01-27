class CreateBusinessDomains < ActiveRecord::Migration[5.0]
  def change
    create_table :business_domains do |t|
      t.string :name
      t.string :alias_name
      
      t.timestamps
    end
  end
end
