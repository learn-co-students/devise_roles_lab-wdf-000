class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    if @user.id != current_user.id
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to root_path
  end
end
