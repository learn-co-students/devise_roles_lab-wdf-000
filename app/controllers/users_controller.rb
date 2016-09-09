class UsersController < ApplicationController
  def destroy
    @user = User.find(params[:id])

    return head(:forbidden) unless current_user.admin?
    
    @user.destroy
  end
  def index
  end
  def new
  end
  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to root_path, :alert => "Access denied."
      end
    end
  end
  def create
  end
end
