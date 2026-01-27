class ApplicationController < ActionController::Base
  include MetaTags::ControllerHelper
  protect_from_forgery with: :exception

  # Используем before_action вместо around_action для switch_locale
  before_action :switch_locale
  before_action :set_default_format

  def default_url_options
    { locale: I18n.locale }
  end

  private

  # Простой before_action для установки локали
  def switch_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # Устанавливаем формат по умолчанию в HTML, чтобы Rails не выдавал 406
  def set_default_format
    request.format = :html unless params[:format]
  end

  # Аутентификация пользователя
  def authenticate_user!
    return if Rails.env.development?
    Rails.logger.info("USER_SIGNED_IN: #{user_signed_in?}")
    return if user_signed_in?
    remember_last_url

    redirect_to(user_google_oauth2_omniauth_authorize_path)
  end

  def remember_last_url
    session[:last_url] = request.url if request.get?
  end

  # Установка мета-тегов через set_meta_tags
  def set_custom_page_title(title)
    set_meta_tags(title: title)
  end

  # Поддержка локали по домену
  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end

  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    parsed_locale = 'ru' if parsed_locale == 'xn--p1ai'
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  # Методы для работы с meta_information
  def meta_information(page)
    MetaInformation.find_or_new_by_page(page)
  end

  def page_meta_tags(page)
    Pages::MetaTags.new(meta_information(page), self)
  end
end
