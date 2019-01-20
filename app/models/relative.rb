class Relative < ApplicationRecord

  validates :first_name, presence: true, length:  { maximum: 20, minimum: 3 }
  validates :second_name, presence: true, length:  { maximum: 40, minimum: 3 }
  validates :maiden_name, presence: true, length:  { maximum: 30, minimum: 3 }
  validates :born, presence: true, length:  { maximum: 25, minimum: 9 }

  mount_uploader :image, ImageUploader

  def self.search(search)
    where("second_name ILIKE ?", "%#{search}%")
  end

end
