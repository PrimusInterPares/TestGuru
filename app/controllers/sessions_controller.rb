class SessionsController < ApplicationController
  def new; end

  def create
    @_current_user = User.find_by(email: params[:email])

    if @_current_user&.authenticate(params[:password])
      session[:user_id] = @_current_user.id
      redirect_to tests_path, status: :see_other
    else
      flash.now[:alert] = 'Email or Password is incorrect. Please, enter your Email and Password.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # Remove the user id from the session
    session.delete(:current_user_id)
    # Clear the memoized current user
    @_current_user = nil
    redirect_to login_path, status: :see_other
  end
end
