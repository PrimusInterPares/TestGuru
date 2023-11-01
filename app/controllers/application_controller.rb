class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_sign_up_params, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    user_signed_in? && current_user.admin? ? admin_tests_path : root_path
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name surname])
  end
end
