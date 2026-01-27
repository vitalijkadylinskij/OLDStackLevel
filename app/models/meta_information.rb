class MetaInformation < ActiveRecord::Base
  scope :locale, -> (locale) { where locale: locale }

  def self.find_or_new_by_page(page_name)
    find_by(page: page_name, locale: I18n.locale) || create(page: page_name, title: page_name, locale: I18n.locale)
  end
end
