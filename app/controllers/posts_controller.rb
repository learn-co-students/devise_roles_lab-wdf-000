class PostsController < ApplicationController

  def update
    post = Post.find_by(id: params[:id])
    return head(:forbidden) unless current_user.admin? || current_user.vip?
    post.update(content: params[:post][:content])
  end










end
