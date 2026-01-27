class HomeController < ApplicationController
  # Главная страница
  def index
    @request = OrderRequest.new
    @case_studies = CaseStudy.locale(I18n.locale).order(:position)

    # Устанавливаем мета-теги
    set_meta_tags page_meta_tags('STACKLEVEL - Custom Software Development Company').tags
    set_meta_tags icon: [
      { href: '/favicon-32x32.png', sizes: '32x32', type: 'image/png' },
      { href: '/favicon-16x16.png', sizes: '16x16', type: 'image/png' },
      { href: '/apple-touch-icon.png', rel: 'apple-touch-icon', sizes: '180x180' }
    ]

    # Явно рендерим шаблон index.html.slim
    respond_to do |format|
      format.html { render :index }
    end
  end

  # Страница отдельного кейса
  def show
    @case_study = CaseStudy.find_by(path_name: params[:id], locale: I18n.locale)
    set_meta_tags page_meta_tags(params[:id]).tags

    respond_to do |format|
      format.html { render :show }
    end
  end
end

