class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_current_user
  before_action :set_locale
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  def set_current_user
    Test.current_user = current_user
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:full_name, :email, :password, :password_confirmation, :avatar, :avatar_cache, :categgory_id, :subject_id )}
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:full_name, :email, :password, :remember_me, :avatar, :avatar_cache) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:full_name, :email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar) }
  end

end
