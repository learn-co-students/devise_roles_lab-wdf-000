class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def index
    @users = User.all
  end

  def show
    # Why is the use of .to_i required this time?
    # And it seems only for this action...
    if current_user.id != params[:id].to_i
      redirect_to root_path, alert: 'Access denied.'
    end
  end

  def destroy
    if current_user.admin?
      user = User.find_by(id: params[:id])
      user.destroy
    end
    redirect_to '/'
  end

  private

  def require_login
    redirect_to root_path unless current_user
  end
end
