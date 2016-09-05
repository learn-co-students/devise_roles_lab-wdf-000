class UsersController < ApplicationController
  
  def index

    @users = User.all
    #
    # redirect_to users_path
  end

  def show
    @user = User.find_by(id: params[:id])
    return head(:forbidden) unless current_user.try(:id) == @user.id || current_user.admin?
  end

  def destroy
    @user = User.find_by(id: params[:id])
    return head(:forbidden) unless current_user.try(:id) == @user.id || current_user.admin?
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.permit(:id)
  end
end
