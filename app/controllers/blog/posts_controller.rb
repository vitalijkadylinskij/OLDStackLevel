class Blog::PostsController < ApplicationController
  def index
    set_meta_tags(page_meta_tags('STACKLEVEL - Blog').tags)
    @posts = Blog::Post.published
  end

  def show
    set_meta_tags(page_meta_tags(params[:id]).tags)
    @post = Blog::Post.find_by(slug: params[:id])
  end
end
