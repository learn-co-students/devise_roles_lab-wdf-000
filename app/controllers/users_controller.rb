class UsersController < ApplicationController
  # before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    unless current_user.id == params[:id]
      flash[:notice] = "Access denied."
      return redirect_to root_path
    else
      @user = User.find_by(id: params[:id])
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    return head(:forbidden) unless current_user.try(:id) == @user.id || current_user.admin?
    @user.destroy
    flash[:alert] = "Signed out successfully."
    redirect_to users_path
  end


  private

  def user_params
    params.permit(:id)
  end
end
