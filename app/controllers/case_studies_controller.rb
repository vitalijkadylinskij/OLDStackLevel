class CaseStudiesController < ApplicationController
  def index
    set_meta_tags(page_meta_tags('STACKLEVEL - Portfolio').tags)
    @q = CaseStudy.locale(I18n.locale).ransack(params[:q])
    @case_studies = @q.result.includes(:technologies)
  end

  def show
    set_meta_tags(page_meta_tags(params[:id]).tags)
    @case_study = CaseStudy.find_by(path_name: params[:id], locale: I18n.locale)
  end
end
