class UsersController < ApplicationController
  def index
    binding.pry
  end

  def update
  end

  def destroy
    if current_user.admin?
      user = User.find_by(id: params[:id])
      user.destroy
    end
    redirect_to '/'
  end
end
