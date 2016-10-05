class UsersController < ApplicationController


  def destroy
    # binding.pry
  if current_user.admin?
     user = User.find_by(:id => params[:id])
     user.delete
   end

  end


  def update
    # binding.pry
  if current_user.admin?
     user = User.find_by(:id => params[:id])
     user.update
   end

  end


  def show
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user
      # flash[:error] = "Access denied."
      # flash[:notice] = "Access denied."
      flash[:alert] = "Access denied."
    end
  end

  def index
    @users = User.all
  end

end
