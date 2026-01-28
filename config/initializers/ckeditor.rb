# config/initializers/ckeditor.rb

Rails.application.config.to_prepare do
  # любые кастомные настройки CKEditor здесь
  Ckeditor.setup do |config|
    # config settings, если нужно
    config.asset_path = 'uploads/ckeditor'
  end
end
