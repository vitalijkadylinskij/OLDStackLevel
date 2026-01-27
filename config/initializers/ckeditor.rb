# config/initializers/ckeditor.rb
require 'ckeditor/orm/active_record'

Rails.application.config.to_prepare do
  # любые кастомные настройки CKEditor здесь
  Ckeditor.setup do |config|
    # config settings, если нужно
  end
end
