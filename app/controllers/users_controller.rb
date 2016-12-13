class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user != current_user
      flash[:error] = "Access denied."
      redirect_to root_path
    end
  end

  def destroy
    if current_user.admin?
      user = User.find(params[:id])
      user.delete
      redirect_to root_path
    else
      flash[:error] = "Incorrect Permissions"
      redirect_to root_path
    end
  end
end
