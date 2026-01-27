class CaseStudyImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Use local file storage unless explicitly enabled via env.
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def store_dir
    "uploads/#{mounted_as}/#{model.id}"
  end
end
