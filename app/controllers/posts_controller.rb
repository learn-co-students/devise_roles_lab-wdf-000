class PostsController < ApplicationController

  def update
    @post = Post.find(params[:id])
    # byebug
    return head(:forbidden) unless current_user.admin? || current_user.vip?
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def show
  end

  def post_params
    params.require(:post).permit(:content, :owner)
  end
end
