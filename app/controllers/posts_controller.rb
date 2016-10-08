class PostsController < ApplicationController
  
  before_action :admin_or_vip_role, only: [:update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :set_post, only: [:new, :edit]


  def new

  end

  def create
    post = Post.create(post_params)
    redirect_to post_path(post)
  end

  def update
    post = Post.find_by(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to post_path(post)
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  private
  
  def set_post
    @post = Post.find_by_id(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

  def admin_or_vip_role
    redirect_to root_path unless current_user.admin? || current_user.vip?
  end
end
