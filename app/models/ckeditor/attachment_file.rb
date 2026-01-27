require 'ckeditor/orm/active_record'

class Ckeditor::AttachmentFile < Ckeditor::Orm::ActiveRecord::AttachmentFile
  include Ckeditor::Orm::ActiveRecord::AssetBase

  delegate :url, :current_path, :content_type, to: :data

  validates :data, presence: true
end
