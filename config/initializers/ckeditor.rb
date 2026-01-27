# config/initializers/ckeditor.rb
require 'ckeditor/orm/active_record'

# Регистрируем кастомные модели, чтобы Rails не пытался их автозагрузить
Dir[Rails.root.join('app/models/ckeditor/*.rb')].each do |file|
  require file
end