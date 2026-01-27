class Cp::MetaInformationsController < ControlPanelController
  before_action :set_meta_information, only: [:show, :edit, :update, :destroy]

  def index
    @meta_informations = ::MetaInformation.where(nil)
    @meta_informations = ::MetaInformation.locale(params[:locale]) if params[:locale].present?
  end

  def show
  end

  def edit
  end

  def update
    @meta_information.update(meta_information_params)

    redirect_to cp_meta_informations_path
  end

  def destroy
    redirect_to cp_meta_informations_path if @meta_information.destroy
  end

  private

  def set_meta_information
    @meta_information = ::MetaInformation.find(params[:id])
  end

  def meta_information_params
    params.require(:meta_information).permit(:title, :description, :keywords)
  end
end
