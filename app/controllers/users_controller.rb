class UsersController < ApplicationController

  def show
    # show listing of user (profile page doubles up as own listings page)
  end

  def edit
    # edit profile
    @user = User.find(params[:id])
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :address, :state, :city)
  end
end