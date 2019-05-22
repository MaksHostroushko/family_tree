class Page < ApplicationRecord
  include Sluggi::Slugged

  def slug_value
    title
  end

  def slug_value_changed?
    title_changed?
  end
end
