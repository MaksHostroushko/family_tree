require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:relatives), dependent:(:destroy) }
  it { should have_many(:categories), dependent:(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:second_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should validate_length_of(:email).is_at_most(255) }
  it { should validate_length_of(:password).is_at_least(6) }
end
