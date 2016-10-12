class PostsController < ApplicationController

  def edit
    # binding.pry
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:post][:content]
    @post.save
    redirect_to post_path(@post)
    # binding.pry
  end


end
