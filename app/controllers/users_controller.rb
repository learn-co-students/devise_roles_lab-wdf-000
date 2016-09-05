class UsersController < ApplicationController
	before_action :admin_only, :only => :destroy

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		unless current_user && current_user.admin?
			unless @user == current_user
				redirect_to root_path, :alert => "Access denied."
			end
		end
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		redirect_to users_path, :notice => "User deleted."
	end

	private

	def admin_only
		unless current_user.admin?
			redirect_to root_path, :alert => "Access denied."
		end
	end

	def secure_params
		params.require(:user).permit(:role)
	end

	def vip_only
		unless current_user.vip?
			redirect_to root_path, :alert => "Access denied."
		end
	end
end
