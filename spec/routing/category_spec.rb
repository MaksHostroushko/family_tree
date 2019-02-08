require 'rails_helper'

# describe "relative routes" do
describe CategoriesController do
  it { should route(:get, '/categories').to(action: :index) }
  it { should route(:get, '/categories/1').to(action: :show, id: 1) }
end
