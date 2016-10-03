class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :destroy]
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
    return access_denied(posts_path) unless current_user.admin? || current_user.vip?
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def access_denied(path)
    redirect_to path, alert: 'Access denied.'
  end
end
