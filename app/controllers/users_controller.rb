class UsersController < ApplicationController
  def destroy
    return redirect_to(root_path) unless current_user.admin? #|| current_user.vip?
    @user = User.find(params[:id])
    @user.destroy
    return redirect_to root_path
  end

  def show
    if current_user.id != params[:id]
      flash[:notice] = 'Access denied.'
      return redirect_to root_path
    else
      @user = User.find_by(id:params[:id])
    end
  end

  private
  def user_params
    params.require(:user).permit(:lol)
  end

end
