require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "#before_action " do
    it { should use_before_action(:find_category) }
    it { should_not use_before_action(:category_params) }
  end
end
