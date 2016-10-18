class PostsController < ApplicationController

  def update
    @post = Post.find(params[:id])
    return head(:forbidden) unless current_user.admin? ||
                       current_user.vip? ||
                   current_user.try(:id) == @post.id
    @post.update(content:params[:post][:content])
  end

end
