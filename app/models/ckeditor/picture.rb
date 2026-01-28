module Ckeditor
  class Picture < Asset
    # Только специфичное для картинок
    has_one_attached :data # если используете ActiveStorage
  end
end
