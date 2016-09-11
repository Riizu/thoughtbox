class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    authenticate_user(user)
  end

  private

  def authenticate_user(user)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:warning] = "Please enter a valid username and password"
      redirect_to login_path
    end
  end
end