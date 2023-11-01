class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    user_signed_in? && current_user.is_a?(Admin) ? admin_tests_path : root_path
  end
end
