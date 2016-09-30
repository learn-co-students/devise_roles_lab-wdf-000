class UsersController < ApplicationController
  def index
  end

  def update
    # if current_user.admin?
    #   user = User.find_by(id: params[:id])
    #   user.update
    # end
    # redirect_to '/'
  end

  def destroy
    if current_user.admin?
      user = User.find_by(id: params[:id])
      user.destroy
    end
    redirect_to '/'
  end
end
