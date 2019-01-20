class Category < ApplicationRecord
  has_many :category_relatives, dependent: :nullify
  has_many :relatives, through: :category_relatives
end
