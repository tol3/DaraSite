# encoding: utf-8

class AdsUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # def remove_animation
  #   manipulate! do |img|
  #     if img.mime_type.match /gif/
  #       img.collapse!
  #     end
  #     img
  #   end
  # end

  # def resize_with_animate(width, height)
  #   manipulate! do |img|
  #     if img[:format].downcase == 'gif'
  #       #coalesce animated gifs before resize.
  #       img.coalesce
  #     end
  #     img.resize "#{width}x#{height}>"
  #     img = yield(img) if block_given?
  #     img
  #   end
  # end

  version :thumb do
    # process :resize_with_animate => [100, 100]
    process :resize_to_fit => [100, 100]
  end

  version :s1 do
    # process :resize_with_animate =>[1500,200]
    process :resize_and_pad => [1500, 200, "#efefef"]
  end

  version :s2 do
    # process :resize_with_animate =>[450,400]
    process :resize_and_pad => [450, 400, "#efefef"]
  end

  version :s3 do
    # process :resize_with_animate =>[200,700]
    process :resize_and_pad => [200, 700, "#efefef"]
  end

  version :s4 do
    # process :resize_with_animate =>[450,900]
    process :resize_and_pad => [450, 900, "#efefef"]
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
