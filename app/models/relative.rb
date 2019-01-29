class Relative < ApplicationRecord
  belongs_to :user
  has_many :category_relatives, dependent: :nullify
  has_many :categories, through: :category_relatives

  validates :first_name, presence: true, length:  { maximum: 20, minimum: 3 }
  validates :second_name, presence: true, length:  { maximum: 40, minimum: 3 }
  validates :born, presence: true, length:  { maximum: 25, minimum: 9 }

  mount_uploaders :images, ImageUploader

  def self.search(search)
    where("first_name LIKE ?", "%#{search}%")
  end
end
