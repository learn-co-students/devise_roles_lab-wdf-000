class UsersController < ApplicationController
  def destroy
    User.find(params[:id]).destroy if current_user.admin?
  end

  def show
    @user = User.find(params[:id])
    render :text => 'Access denied.' if current_user.id != @user.id
  end

  private
  def user_params
    params.require(:user).permit(:lol)
  end
end
