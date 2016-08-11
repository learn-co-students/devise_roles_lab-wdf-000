class PostsController < ApplicationController
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  private

  def post_params
      params.require(:post).permit(:content, :user_id)
  end
end
