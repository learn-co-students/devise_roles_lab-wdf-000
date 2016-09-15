class PostsController < ApplicationController
  before_action :owner_or_higher_up, only: [:update]
  before_action :owner_or_admin, only: [:destroy]
  # before_action :require_login, only: [:new, :create]
  before_action :authenticate_user!, only: [:new, :create, :index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post_path(post)
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    post = Post.find_by_id(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find_by_id(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def is_owner?
    Post.find_by_id(params[:id]).user_id == current_user.id
  end

  def owner_or_higher_up
    unless current_user.vip? || current_user.admin? || is_owner?
      flash[:alert] = "Tut-tut, whaddayathinkyadoin?"
      redirect_to '/'
    end
  end

  def owner_or_admin
    unless current_user.admin? || is_owner?
      flash[:alert] = "Tut-tut, whaddayathinkyadoin?"
      redirect_to '/'
    end
  end

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

end
