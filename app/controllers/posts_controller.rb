class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:edit, :show, :update]



  def new
    @post = Post.new
  end

  def create
    user_id = current_user.id
    @post = Post.new(post_params)
    @post.user_id = user_id
    @post.save
    redirect_to user_path(@post.user)
  end

  def show

  end

  def edit
    unless current_user.admin? || current_user.vip? || current_user.try(:id) == @post.user_id
      flash[:alert] = "Access denied."
      redirect_to post_path(@post)
    end
  end

  def update

    if current_user.admin? || current_user.vip? || current_user.try(:id) == @post.user_id
      @post.update(post_params)
      flash[:notice] = "Post updated!"
    else
      flash[:alert] = "Access denied."
    end
    redirect_to post_path(@post)
  end


  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
