class PostsController < ApplicationController
  before_action :owner_or_higher_up, only: [:update]

  def index
    @posts = Post.all
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
    post = Post.find_by_id(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end

  private

  def is_owner?
    Post.find_by_id(params[:id]).user.id == current_user.id
  end

  def owner_or_higher_up
    unless current_user.vip? || current_user.admin? || is_owner?
      flash[:alert] = "Tut-tut, whaddayathinkyadoin?"
      redirect_to '/'
    end
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
