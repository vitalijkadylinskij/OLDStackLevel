class AddLocaleToMetaInformations < ActiveRecord::Migration[5.0]
  def change
    add_column :meta_informations, :locale, :string
  end
end
