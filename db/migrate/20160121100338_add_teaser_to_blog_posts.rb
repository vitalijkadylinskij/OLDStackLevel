class AddTeaserToBlogPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :blog_posts, :teaser, :text
  end
end
