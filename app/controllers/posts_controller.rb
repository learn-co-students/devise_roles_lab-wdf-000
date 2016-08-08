class PostsController < ApplicationController
  def update
    if current_user.admin? || current_user.vip?
      @post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to root_path
    else
      flash[:message] = "Access denied"
      redirect_to root_path
    end
  end

  def destroy
    if current_user.admin? || current_user.vip?
      post = Post.find(params[:id])
      post.destroy
      redirect_to root_path
    else
      redirect_to root_path, alert: "Not authorized"
    end
  end

  private
    def post_params
      params.require(:post).permit(:content, :user_id)
    end
end
