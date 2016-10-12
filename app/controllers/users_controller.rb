class UsersController < ApplicationController

  # before_action :default

  # def default
  #   binding.pry
  #   self.role ||= :user
  # end


  # def initialize(user)
  #   binding.pry
  #   self.role ||= :user
  # end

  def new
  end

  def index
    @users = User.all
  end


  def destroy
    # binding.pry
    if current_user.admin?
      @user = User.find_by(id: params[:id])
      @user.destroy
      redirect_to '/'
    else
      redirect_to '/'
    end
    # binding.pry
  end

  def show

    # binding.pry
    @user = User.find_by(id: params[:id])
    if current_user != @user
      render 'error'
    end
  end


end
