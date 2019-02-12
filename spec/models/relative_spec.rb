require 'rails_helper'

RSpec.describe Relative, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to have_many(:categories), dependent:(:nullify) }
    it { is_expected.to have_many(:categories), through:(:category_relatives)}

    it { is_expected.to validate_presence_of(:first_name)}
    it { is_expected.to validate_presence_of(:second_name)}
    it { is_expected.to validate_presence_of(:born)}
    it { is_expected.to validate_presence_of(:description)}

    it { is_expected.to validate_length_of(:first_name).is_at_least(3) }
    it { is_expected.to validate_length_of(:second_name).is_at_least(3) }
    it { is_expected.to validate_length_of(:born).is_at_least(9) }
    it { is_expected.to validate_length_of(:description).is_at_least(20) }

    it { is_expected.to validate_length_of(:first_name).is_at_most(20) }
    it { is_expected.to validate_length_of(:second_name).is_at_most(40) }
    it { is_expected.to validate_length_of(:born).is_at_most(20) }
  end
end
