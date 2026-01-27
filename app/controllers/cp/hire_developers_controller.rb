class Cp::HireDevelopersController < ControlPanelController
    before_action :set_hire_developer, only: [:show, :edit, :update, :destroy]

    def index
        @hire_developers = HireDeveloper.where(nil)
        @hire_developers = HireDeveloper.locale(params[:locale]) if params[:locale].present?
    end

    def show
        @excluded_developers = HireDeveloper.locale(I18n.locale).order("RANDOM()").limit(4) - [@hire_developer]
    end 

    def new
        @hire_developer = HireDeveloper.new
    end

    def edit
    end

    def create 
        @hire_developer = HireDeveloper.new(hire_developer_params)

        if @hire_developer.save
            redirect_to cp_hire_developers_path
        else
            render new_cp_hire_developer_path
        end
    end

    def update 
        if @hire_developer.update(hire_developer_params)
            redirect_to cp_hire_developers_path
        else
            render cp_hire_developers_path
        end
    end

    def destroy
        @hire_developer.destroy

        redirect_to cp_hire_developers_path
    end

    private

    def set_hire_developer
        @hire_developer = HireDeveloper.find(params[:id])
    end

    def hire_developer_params
        params.require(:hire_developer).permit(:locale, :path_name, :developer_title, :experience_description, 
                                                technology_ids: [], framework_ids: [], business_domain_ids: [], case_study_ids: [] )
    end
    
end
