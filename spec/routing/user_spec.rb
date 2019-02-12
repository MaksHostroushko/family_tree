require 'rails_helper'

# describe "relative routes" do
describe UsersController do
  it { is_expected.to route(:get, '/users').to(action: :index) }
  it { is_expected.to route(:get, '/users/1').to(action: :show, id: 1) }
  it { is_expected.to route(:get, '/users/new').to(action: :new) }
end
