class UsersController < ApplicationController

  def index
    @users = User.all 
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user == nil
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.delete
    redirect_to root_path
  end

end
