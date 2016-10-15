class UsersController < ApplicationController


  def index
    if user_signed_in?
      @user = current_user
      @users = User.all
    end
  end


  def show
    if user_signed_in? && (current_user.id == params[:id].to_i)
      @user = User.find_by(id: params[:id])
        render 'show'
    else
      flash[:error] = "Access denied."
        redirect_to '/'
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    return head(:forbidden) unless current_user.admin?
    user.destroy
  end



end
