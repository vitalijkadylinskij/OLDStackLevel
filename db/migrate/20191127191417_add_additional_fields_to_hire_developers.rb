class AddAdditionalFieldsToHireDevelopers < ActiveRecord::Migration[5.0]
  def change
    add_column :hire_developers, :locale, :string
    add_column :hire_developers, :path_name, :string    
    add_column :hire_developers, :developer_title, :string    
    add_column :hire_developers, :experience_description, :string   
  end
end
