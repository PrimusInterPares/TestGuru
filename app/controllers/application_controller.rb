class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  protect_from_forgery with: :exception

  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    return if current_user

    redirect_to login_path, status: :see_other, alert: 'Authorise to access Test Guru'
    cookies.encrypted[:path_to_prev_request] = request.fullpath
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
