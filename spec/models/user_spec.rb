require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to have_many(:relatives), dependent:(:destroy) }
    it { is_expected.to have_many(:categories), dependent:(:destroy) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:second_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }

    it { is_expected.to validate_length_of(:email).is_at_most(255) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end

  # describe "user" do
  #   it "authenticate with mathcing name and password" do
  #     user = FactoryBot.create(:user, name: "trashko", password: '123456')
  #     User.authenticate("trashko", password: '123456').should eq(user)
  #   end
  #
  #   it "doesn't authenticate with mathcing name and password" do
  #     user = FactoryBot.create(:user, name: "trashko", password: '123456')
  #     User.authenticate("trashko", password: 'incorrect').should be_nil
  #   end
  # end
end
