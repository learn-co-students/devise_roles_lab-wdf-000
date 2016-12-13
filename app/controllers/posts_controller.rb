class PostsController < ApplicationController

  def update
    if current_user.admin? || current_user.vip?
      @post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to root_path
    else
      flash[:error] = "Incorrect Permissions"
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
