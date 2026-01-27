class Cp::CaseStudiesController < ControlPanelController
  before_action :set_case_study, only: [:show, :edit, :update, :destroy]

  def index
    @case_studies = CaseStudy.where(nil)
    @case_studies = CaseStudy.locale(params[:locale]) if params[:locale].present?
  end

  def show
  end

  def new
    @case_study = CaseStudy.new
  end

  def edit
  end

  def create
    @case_study = CaseStudy.new(case_study_params)

    if @case_study.save
      redirect_to cp_case_study_path(@case_study)
    else
      render new_cp_case_study_path
    end
  end

  def update
    if @case_study.update(case_study_params)
      redirect_to cp_case_study_path(@case_study)
    else
      render edit_cp_case_study_path
    end
  end

  def destroy
    @case_study.destroy

    redirect_to cp_case_studies_path
  end

  private

  def set_case_study
    @case_study = CaseStudy.find(params[:id])
  end

  def case_study_params
    params.require(:case_study).permit(:locale, :path_name, :project_title, :project_bg,
                                       :first_solution, :second_solution, :third_solution,
                                       :business_case_description, :developted_solution_description,
                                       :business_challenge, :proud_of, :result, :section, :technology,
                                       :duration,:team, :customer, :screenshots => [], 
                                       technology_ids: [], integration_ids: [], business_domain_ids: [],)
  end
end
