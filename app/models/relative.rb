class Relative < ApplicationRecord
  belongs_to :user
  has_many :category_relatives, dependent: :nullify
  has_many :categories, through: :category_relatives

  validates :first_name, presence: true, length:  { minimum: 3, maximum: 20 }
  validates :second_name, presence: true, length:  { minimum: 3 , maximum: 40}
  validates :born, presence: true, length:  { minimum: 9, maximum: 20 }
  validates :description, presence: true, length:  {  minimum: 20 }

  mount_uploaders :images, ImageUploader

  def self.search(search)
    where("first_name LIKE ?", "%#{search}%")
  end
end
