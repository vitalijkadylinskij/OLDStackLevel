class Cp::OrderRequestsController < ControlPanelController
  before_filter :load_order_request, only: [:show]
  # skip_before_filter :authenticate_user!, only: [:create]

  def index
    @order_requests = OrderRequest.all
  end

  def show
  end

  def create
    @order_request = OrderRequest.new(order_request_params)

    if @order_request.save
      render nothing: true, status: 200, content_type: 'text/html'
    else
      respond_to do |format|
        format.html { render 'home/index.html.slim' }
        format.json { render(json: @pay_run_employee.errors.full_messages) }
      end
    end
  end

  private

  def order_request_params
    params
      .require(:order_request)
      .permit(:name, :description, :email, :budget, :position)
  end

  def load_order_request
    @order_request = OrderRequest.find(params[:id])
  end
end
