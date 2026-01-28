# app/models/ckeditor/asset.rb
module Ckeditor
  class Asset < ApplicationRecord
    self.table_name = 'ckeditor_assets' # если используете стандартную таблицу

    # Общие ассоциации
    has_many :pictures, class_name: 'Ckeditor::Picture', foreign_key: 'asset_id', dependent: :destroy
    has_many :attachment_files, class_name: 'Ckeditor::AttachmentFile', foreign_key: 'asset_id', dependent: :destroy

    # Валидации
    validates :data_file_name, presence: true
  end
end

