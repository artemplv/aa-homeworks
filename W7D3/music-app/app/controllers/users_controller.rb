class UsersController < ApplicationController
  before_action :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: [:show]
  
  def new
    render :new
  end

  def show
    render :show
  end

  def create
    user = User.new(user_params)

    if user.save
      login(user)
      redirect_to user_url(user.id)
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end