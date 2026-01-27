class Cp::CareersController < ControlPanelController
  before_action :set_career, only: [:edit, :update, :destroy]

  def index
    @careers = ::Career.where(nil)
    @careers = ::Career.locale(params[:locale]) if params[:locale].present?
  end

  def new
      @career = Career.new
  end

  def create 
      @career = Career.new(career_params)

      if @career.save
          redirect_to cp_careers_path
      else
          render new_cp_careers_path
      end
  end

  def destroy
      @career.destroy

      redirect_to cp_careers_path
  end

  def edit
  end

  def update
    @career.update(career_params)

    redirect_to cp_careers_path
  end

  private

  def set_career
    @career = ::Career.find(params[:id])
  end

  def career_params
    params.require(:career).permit(:locale, :title, :description, technology_ids: [], framework_ids: [])
  end
end
