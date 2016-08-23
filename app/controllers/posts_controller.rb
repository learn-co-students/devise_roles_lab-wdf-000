class PostsController < ApplicationController
  def update
    return redirect_to(root_path) unless current_user.vip? || current_user.admin?
    tmp = Post.find_by(id:params[:id])
    tmp.update(post_params)
    if tmp.save
      redirect_to post_path(tmp)
    else
      redirect_to root_path
    end
  end


  private
  def post_params
    params.require(:post).permit(:content)
  end
end
