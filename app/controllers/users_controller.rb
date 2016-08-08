class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless current_user == @user
      flash[:message] = "Access denied."
      redirect_to root_path
    end
  end

  def destroy
    if current_user.admin?
      user = User.find(params[:id])
      user.destroy
      redirect_to root_path
    else
      flash[:message] = "Access denied."
      redirect_to root_path
    end
  end
end
