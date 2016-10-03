class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
  end

  def new
  end

  def show
    access_denied(root_path) unless current_user == @user
  end

  def update
  end

  def destroy
    return access_denied(users_path) unless current_user.admin?
    @user.destroy
    redirect_to users_path, notice: 'User deleted.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def access_denied(path)
    redirect_to path, alert: 'Access denied.'
  end
end
