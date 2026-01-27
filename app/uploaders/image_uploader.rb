class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  version :social_networks do
    process resize_to_fit: [1024, 512]
  end

  version :thumb do
    process :resize_to_limit => [300, 200]
  end

  version :prev do
    process :resize_to_fill => [450, 450]
  end

  def store_dir
    "uploads/#{mounted_as}/#{model.id}"
  end
end
