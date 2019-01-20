class CategoryRelative < ApplicationRecord
  belongs_to :relative, dependent: :destroy
  belongs_to :category, dependent: :destroy
end
