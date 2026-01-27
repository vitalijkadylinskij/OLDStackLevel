class CreateBlogPosts < ActiveRecord::Migration[4.2]
  def change
    create_table :blog_posts do |t|
      t.string :slug, index: true
      t.string :title
      t.text :body

      t.timestamp :published_at
      t.timestamps
    end
  end
end
