class UsersController < ApplicationController
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message, :notice => "Access denied."
  end

  def destroy
    User.find(params[:id]).destroy
  end

  def index
  end

  def show
  end

end
