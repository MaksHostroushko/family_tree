require 'rails_helper'

# describe "relative routes" do
describe UsersController do
  it { should route(:get, '/users').to(action: :index) }
  it { should route(:get, '/users/1').to(action: :show, id: 1) }
  it { should route(:get, '/users/new').to(action: :new) }
end
