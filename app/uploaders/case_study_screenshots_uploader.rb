class CaseStudyScreenshotsUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{mounted_as}/#{model.id}"
  end
end
