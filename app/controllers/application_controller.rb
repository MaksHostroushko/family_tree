class ApplicationController < ActionController::Base
  include ActionController::Caching

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_pages
  protect_from_forgery with: :null_session

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

 def set_pages
   @pages = Page.all.page(params[:page]).per(10)
 end

 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :second_name, :name, :image, :collaborators) }
  end
end
