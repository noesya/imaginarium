class UsersController < ApplicationController

  def update
    current_user.update user_params
    redirect_back fallback_location: current_user.images.last
  end

  protected

  def user_params
    params.require(:user).permit(:pseudo, :email)
  end
end