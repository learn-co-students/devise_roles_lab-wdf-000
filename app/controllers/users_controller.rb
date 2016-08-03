class UsersController < ApplicationController
	before_action :check_admin, only: :destroy
	# before_action :authenticate_user!, except: [:create, :new]

 
   def index
     @user = current_user || User.new
   end
 
   def destroy
     user = User.find(params[:id])
     user.destroy
     redirect_to users_path, :notice => "User deleted."
   end  

   def show
     @user = User.find(params[:id])
     render :text => 'Access denied.'  if current_user.id != @user.id
   end

   private
   def check_admin
   		redirect_to users_path, :alert => "Access denied." unless current_user.admin?
   end
end
