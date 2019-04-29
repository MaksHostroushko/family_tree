class ApplicationController < ActionController::Base
  include ActionController::Caching

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def set_locale
   I18n.locale = params[:locale] || I18n.default_locale
 end

  def default_url_options(options = {})
   { locale: I18n.locale }.merge options
 end

 def configure_permitted_parameters
   user_attr = [:password, :password_confirmation, :current_password, :name, :email, :second_name, :collaborators, :image ]

   devise_parameter_sanitizer.permit :account_update, keys: user_attr
   devise_parameter_sanitizer.permit :sign_up, keys: user_attr
 end
end
