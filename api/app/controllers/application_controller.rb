class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :update_sanitized_params, if: :devise_controller?

  private

  # rescue_from Exception, with: :error_render_method

  # def error_render_method
  #   p '-'*50
  #   p caller.join("\n")
  # end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:full_name, :email, :password, :password_confirmation, :klass_id)}
  end

end