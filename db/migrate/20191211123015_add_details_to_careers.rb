class AddDetailsToCareers < ActiveRecord::Migration[5.0]
  def change
    add_column :careers, :locale, :string
  end
end
