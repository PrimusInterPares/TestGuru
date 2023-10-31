class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_sign_up_params, only: :create

  before_action :authenticate_user!

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name surname])
  end
end
