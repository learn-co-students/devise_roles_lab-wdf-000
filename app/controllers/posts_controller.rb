class PostsController < ApplicationController
	before_action :set_post, only: [:update]

	def update
		@post.update(posts_params)
		redirect_to post_path(@post)
	end

	def new
		@post = Post.new
	end

	private
	def set_post
		@post = Post.find(params[:id])
	end

	def posts_params
		params.require(:post).permit(:content, :user_id)
	end
end
