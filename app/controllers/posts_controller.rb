class PostsController < ApplicationController
	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to posts_path, :notice => "Post updated."
		else
			redirect_to posts_path, :alert => "Unable to update post."
		end
	end

	def destroy
		post = Post.find(params[:id])
		post.destroy
		redirect_to posts_path, :notice => "Post deleted."
	end

	private

	def admin_only
		unless current_user.admin?
			redirect_to root_path, :alert => "Access denied."
		end
	end

	def vip_only
		unless current_user.vip?
			redirect_to root_path, :alert => "Access denied."
		end
	end

	def post_params
		params.require(:post).permit(:content)
	end
end