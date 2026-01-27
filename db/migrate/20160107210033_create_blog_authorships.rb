class CreateBlogAuthorships < ActiveRecord::Migration[4.2]
  def change
    create_table :blog_authorships do |t|
      t.references :post, index: true
      t.references :author, index: true

      t.timestamps null: false
    end
  end
end
