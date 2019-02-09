require 'rails_helper'

RSpec.describe RelativesController, type: :controller do
  describe "#index" do
    subject { get :index }

    it "should return success response" do
      subject
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#before_action " do
    it { should use_before_action(:find_relative) }
    it { should use_before_action(:correct_user) }
    it { should_not use_before_action(:relative_params) }
    it { should_not use_before_action(:find_user) }
  end
end
