class CaseStudyScreenshotsUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Use local file storage unless explicitly enabled via env.
  storage((ENV['CARRIERWAVE_STORAGE'].to_s.downcase == 'fog') ? :fog : :file)

  def store_dir
    "uploads/#{mounted_as}/#{model.id}"
  end
end
