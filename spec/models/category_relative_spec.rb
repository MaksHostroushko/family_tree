require 'rails_helper'

RSpec.describe CategoryRelative, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:relative) }
    it { is_expected.to belong_to(:category) }
  end
end
