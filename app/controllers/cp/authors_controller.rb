class Cp::AuthorsController < ControlPanelController
  def index
    @authors = Blog::Author.all
  end

  def new
    @author = Blog::Author.new
  end

  def create
    @author = Blog::Author.new(author_params)

    if @author.save
      redirect_to cp_blog_authors_path
    else
      render json: { author: { errors: @author.errors } }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def author_params
    params.require(:author).permit(:name)
  end
end
