class CategoryRelative < ApplicationRecord
  belongs_to :relative
  belongs_to :category
end
