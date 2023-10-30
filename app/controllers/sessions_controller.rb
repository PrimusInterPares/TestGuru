class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path, status: :see_other
    else
      flash.now[:alert] = 'Email or Password is incorrect. Please, enter your Email and Password.'
      render :new, status: :unprocessable_entity
    end
  end
end
