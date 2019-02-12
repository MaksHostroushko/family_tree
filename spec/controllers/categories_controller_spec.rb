require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "#before_action " do
    it { is_expected.to use_before_action(:find_category) }
    it { is_expected.to_not use_before_action(:category_params) }
  end
end
