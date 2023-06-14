class SessionsController < ApplicationController
  before_action :require_logged_out, only: [:new]
  
  def new
    render :new
  end

  def create
    email = params[:user][:email]
    pwd = params[:user][:password]
    user = User.find_by_credentials(email, pwd)

    if user
      login(user)
      redirect_to user_url(user.id)
    else
      redirect_to new_session_url
    end
  end

  def destroy
    if logged_in?
      logout

      redirect_to new_session_url
    end
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end