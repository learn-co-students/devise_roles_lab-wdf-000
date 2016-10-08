class PostsController < ApplicationController
  
  before_action :admin_or_vip_role, only: [:update, :destroy]

  def update
    post = Post.find_by(params[:id])
    post.update(post_params)
    redirect_to root_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path

  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

  def admin_or_vip_role
    redirect_to root_path unless current_user.admin? || current_user.vip?
  end
end
