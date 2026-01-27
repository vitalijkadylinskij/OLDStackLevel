class DropBlogPostMetaInformationTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :blog_post_meta_informations do |t|
      t.references :post, index: true
      t.string :custom_title
      t.text :description
      t.string :cover_image
      t.string :keywords

      t.timestamps null: false
    end
  end
end
