class AddDefaultValuesToMetaInformation < ActiveRecord::Migration[4.2]
  def up
    change_column_default :meta_informations, :title, ""
    change_column_default :meta_informations, :description, ""
    change_column_default :meta_informations, :keywords, ""
    change_column_default :meta_informations, :page, ""
  end

  def down
    change_column_default :meta_informations, :title, nil
    change_column_default :meta_informations, :description, nil
    change_column_default :meta_informations, :keywords, nil
    change_column_default :meta_informations, :page, nil
  end
end
