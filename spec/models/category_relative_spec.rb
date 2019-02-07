require 'rails_helper'

RSpec.describe CategoryRelative, type: :model do
  it { should belong_to(:relative) }
  it { should belong_to(:category) }
end
