class Cp::PostsController < ControlPanelController
  before_action :load_post, only: [:show, :edit, :update, :destroy, :publish]

  def index
    @posts = Blog::Post.all
  end

  def show
  end

  def new
    @post = Blog::Post.new
  end

  def edit
  end

  def create
    @post = Blog::Post.new(post_params)
    if @post.save
      redirect_to cp_blog_posts_path
    else
      render json: { post: { errors: @post.errors } }
    end
  end

  def update
    if @post.update(post_params)
      redirect_to cp_blog_posts_path
    else
      render json: { post: { errors: @post.errors } }
    end
  end

  def destroy
    redirect_to cp_blog_posts_path if @post.destroy
  end

  def publish
    if @post.update(published_at: DateTime.now)
      redirect_to cp_blog_posts_path
    else
      render json: { post: { errors: @post.errors } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def load_post
    @post = Blog::Post.find_by(slug: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params
      .require(:post)
      .permit(:title, :body, :slug, :teaser, :tags, :published_at, :preview_image, :time_to_read)
  end
end
