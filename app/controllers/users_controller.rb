class UsersController < ApplicationController
  def index
      @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    unless @user == current_user
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end
  
  def destroy
    @user = User.find_by(id: params[:id])
    @user.delete if current_user.admin?
    flash[:alert] = "Access denied."
    redirect_to root_path
  end
end
