class AddScreenshotColumnToCaseStudies < ActiveRecord::Migration[5.0]
  def change
    add_column :case_studies, :screenshots, :string, array: true, default: [] # add images column as array
  end
end
