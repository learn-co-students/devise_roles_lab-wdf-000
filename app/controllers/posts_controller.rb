class PostsController < ApplicationController

  before_action :authenticate_user!
  def update
    @post = Post.find_by(id: params[:id])
    return head(:forbidden) unless current_user.try(:id) == @post.id
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
