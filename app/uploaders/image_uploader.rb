class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end

  process resize_to_fit: [800, 400]

  version :medium_image do
    process resize_to_fit: [375, 210]
  end

  version :small_image do
    process resize_to_fit: [150, 75]
  end
end
