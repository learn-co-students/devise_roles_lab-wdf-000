class UsersController < ApplicationController

  def index
    @user = current_user || User.new
  end

  def destroy
    user = User.find(params[:id])
    user.destroy if current_user.admin?
    redirect_to '/'
  end  

  def show
    @user = User.find(params[:id])
    render :text => 'Access denied.'  if current_user.id != @user.id
  end
end
