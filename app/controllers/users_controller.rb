class UsersController < ApplicationController
    before_action :for_your_admins_only, only: :destroy
    before_action :for_admins_or_owners_only, only: :show
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
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
      user = User.find_by_id(params[:id])
      user.destroy
      flash[:sassy] = "User deleted. Are you sure you aren't abusing your powers, Boss?"
      redirect_to '/'
  end



  private
  def for_your_admins_only
    unless current_user.admin?
      flash[:alert] = "Why so violent?"
      redirect_to '/'
    end
  end

  def for_admins_or_owners_only
    unless current_user.admin? || is_you?
      flash[:alert] = "Access denied."
      redirect_to '/'
    end
  end

  def is_you?
    params[:id] == current_user.id
  end

end
