class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new; end

  def create
    @_current_user = User.find_by(email: params[:email])

    if @_current_user&.authenticate(params[:password])
      successful_creation
    else
      failed_creation
    end
  end

  def destroy
    reset_session
    redirect_to login_path, status: :see_other
  end

  def successful_creation
    session[:user_id] = @_current_user.id
    redirect_to cookies.encrypted[:path_to_prev_request] || root_path, status: :see_other
    cookies.delete(:path_to_prev_request)
  end

  def failed_creation
    flash.now[:alert] = 'Email or Password is incorrect. Please, try again.'
    render :new, status: :unprocessable_entity
  end
end
