class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    process_new_user(user)
  end

  private

  def process_new_user(user)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email)
  end
end