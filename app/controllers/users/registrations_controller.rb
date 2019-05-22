class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token, only: :create
  before_action :resource_params, if: :devise_controller?
  protected

  def update_resource(resource, params)
    if current_user.provider.nil?
      resource.update_with_password(params)
    else
      resource.update_without_password(params)
    end
  end

  private

  def resource_params
    params.permit(:name, :second_name, :image, :email, :password, :password_confirmation, :current_password)
    devise_parameter_sanitizer.permit(:sign_up) {|user| user.permit(:name, :second_name, :image, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|user| user.permit(:name, :second_name, :image, :email, :password, :password_confirmation, :current_password)}
  end
end
