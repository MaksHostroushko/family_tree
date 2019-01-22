class Category < ApplicationRecord
  has_many :category_relatives, dependent: :destroy
  has_many :relatives, through: :category_relatives, dependent: :destroy
end