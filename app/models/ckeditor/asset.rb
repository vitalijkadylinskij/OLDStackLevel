# frozen_string_literal: true

class Ckeditor::Asset < Ckeditor::Orm::ActiveRecord::Asset
  include Ckeditor::Orm::ActiveRecord::AssetBase

  delegate :url, :current_path, :content_type, to: :data

  validates :data, presence: true
end
