class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def update
    @post = Post.find_by(id: params[:id])
    # byebug
    if has_any_of_roles ['vip', 'admin']
      @post.update(post_params) 
    end

    redirect_to post_path(@post)
  end

  


  private
  def post_params
    params.require(:post).permit(:content)
  end

  def has_any_of_roles(args)
    args.include?(current_user.role)
  end

  def has_all_of_roles(args)
    args.all? {|role| current_user.try(role)}
  end
end
