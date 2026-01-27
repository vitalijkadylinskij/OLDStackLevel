class AddedSomeFieldsToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :blog_posts, :preview_image, :string
    add_column :blog_posts, :time_to_read, :integer
  end
end
