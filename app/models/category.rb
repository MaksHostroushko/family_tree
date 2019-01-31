class Category < ApplicationRecord
  belongs_to :user
  has_many :category_relatives, dependent: :nullify
  has_many :relatives, through: :category_relatives

  validates :name, presence: true
end
