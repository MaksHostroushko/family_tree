class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token, :only => :create
  protected

    def update_resource(resource, params)
      if current_user.provider.nil?
        resource.update_with_password(params)
      else
        resource.update_without_password(params)
      end
    end
end
