class UsersController < ApplicationController
  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin? ||
                   current_user.try(:id) == @user.id
                   @user.delete
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    if current_user.id != @user.id
      flash[:error] = "Access denied."
      redirect_to users_path
    end
  end

end
