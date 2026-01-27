class CreateBlogAuthors < ActiveRecord::Migration[4.2]
  def change
    create_table :blog_authors do |t|
      t.string :name, index: true
      t.references :post, index: true

      t.timestamps null: false
    end
  end
end
