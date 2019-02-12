require 'rails_helper'

# describe "relative routes" do
describe CategoriesController do
  it { is_expected.to route(:get, '/categories').to(action: :index) }
  it { is_expected.to route(:get, '/categories/1').to(action: :show, id: 1) }
end
