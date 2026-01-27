class Cp::FeedbacksController < ControlPanelController
    before_action :set_feedback, only: [:edit, :update, :destroy]
  
    def index
      @feedbacks = ::Feedback.where(nil)
      @feedbacks = ::Feedback.locale(params[:locale]) if params[:locale].present?
    end
  
    def new
        @feedback = Feedback.new
    end

    def create 
        @feedback = Feedback.new(feedback_params)

        if @feedback.save
            redirect_to cp_feedbacks_path
        else
            render new_cp_feedbacks_path
        end
    end

    def destroy
        @feedback.destroy

        redirect_to cp_feedbacks_path
    end
  
    def edit
    end
  
    def update
      @feedback.update(feedback_params)
  
      redirect_to cp_feedbacks_path
    end
  
    private
  
    def set_feedback
      @feedback = ::Feedback.find(params[:id])
    end
  
    def feedback_params
      params.require(:feedback).permit(:locale, :author_photo, :author_name, :feedback_text, :job_title)
    end
  end
  