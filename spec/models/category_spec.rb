require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:category_relatives), dependent:(:nullify) }
  it { should have_many(:relatives), through:(:category_relatives)}

  it { should validate_presence_of(:name)}
end
