class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, notice: exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:full_name, :email, :password, :password_confirmation, :categgory_id, :subject_id, :images, image_attributes: [:id, :photo])}
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:full_name, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:full_name, :email, :password, :password_confirmation, :current_password, :remove_avatar, :images, image_attributes: [:id, :photo]) }
  end

end
