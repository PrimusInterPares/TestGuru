class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :set_locale

  protected

  def after_sign_in_path_for(resource)
    user_signed_in? && current_user.is_a?(Admin) ? admin_tests_path : root_path
  end

  def default_url_options
    { lang: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
