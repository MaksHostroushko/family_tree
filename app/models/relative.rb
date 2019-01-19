class Relative < ApplicationRecord

  mount_uploader :image, ImageUploader

  def self.search(search)
    where("second_name ILIKE ?", "%#{search}%")
  end

end
