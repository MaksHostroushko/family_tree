require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#index" do
    subject { get :index }

    it "should return success response" do
      subject
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#before_action " do
    it { is_expected.to use_before_action(:find_user) }
    it { is_expected.to_not use_before_action(:user_params) }
  end
end
