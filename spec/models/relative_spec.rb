require 'rails_helper'

RSpec.describe Relative, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:categories), dependent:(:nullify) }
  it { should have_many(:categories), through:(:category_relatives)}

  it { should validate_presence_of(:first_name)}
  it { should validate_presence_of(:second_name)}
  it { should validate_presence_of(:born)}
  it { should validate_presence_of(:description)}

  it { should validate_length_of(:first_name).is_at_least(3) }
  it { should validate_length_of(:second_name).is_at_least(3) }
  it { should validate_length_of(:born).is_at_least(9) }
  it { should validate_length_of(:description).is_at_least(20) }

  it { should validate_length_of(:first_name).is_at_most(20) }
  it { should validate_length_of(:second_name).is_at_most(40) }
  it { should validate_length_of(:born).is_at_most(20) }
end
