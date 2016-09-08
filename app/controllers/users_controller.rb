class UsersController < ApplicationController
  def index
    redirect_to posts_path
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to root_path, :alert => "Access denied."
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if has_any_of_roles ['admin']
      @user.destroy
    end

    redirect_to root_path
  end

  private
  def post_params
    params.require(:user).permit(:role)
  end
end
