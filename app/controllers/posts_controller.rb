class PostsController < ApplicationController
  def create
    post = Post.create(post_params) if current_user.user?

    redirect_to '/'
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if (current_user.user? && current_user.posts.include?(post)) || current_user.admin?

    redirect_to '/'
  end

  def edit
    if (current_user.user? && current_user.posts.include?(post)) || current_user.vip? || current_user.admin?
      @post = Post.find(params[:id])
    else
      redirect_to '/'
    end
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)

    redirect_to post_path(post)
  end

  private
  
  def post_params
    params.require(:post).permit(:content)
  end
end
