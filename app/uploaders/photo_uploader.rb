# encoding: utf-8
require 'carrierwave'
require 'mini_magick'

class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  version :thumb do
    process :resize_to_fill => [120, 120]
  end
  version :large do
    process :resize_to_fill => [550, 550]
  end
  def extension_white_list
     %w(jpg jpeg gif png)
 end
end