class PostsController < ApplicationController

  def update
    Post.find(params[:id]).update(post_params)
  end

  def post_params
    params.require(:post).permit(:content)
  end


end
