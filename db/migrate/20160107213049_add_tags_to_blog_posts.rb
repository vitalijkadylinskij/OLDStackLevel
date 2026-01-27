class AddTagsToBlogPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :blog_posts, :tags, :string, array: true, default: []
  end
end
