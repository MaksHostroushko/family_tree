require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to have_many(:category_relatives), dependent:(:nullify) }
    it { is_expected.to have_many(:relatives), through:(:category_relatives)}
    it { is_expected.to validate_presence_of(:name)}
  end
end
