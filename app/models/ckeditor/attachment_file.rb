module Ckeditor
  class AttachmentFile < Asset
    # Только специфичное для файлов
    has_one_attached :data
  end
end
