class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit; end

  def update_password
    if @user.update_with_password(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def ensure_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation,
                                 :current_password)
  end
end
