class UsersController < ApplicationController
  
  def index
    @user = current_user || User.new
  end
  
  def destroy
    if current_user.admin? 
      User.delete(params[:id])
    end
      redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
    if current_user != @user
      flash[:message] = "Access denied."
     redirect_to '/'
    end
  end
end