class PostsController < ApplicationController
	def like
		@post = Post.find(params[:post_id])
		if @post.liked_by?(current_user)
			Like.where(user: current_user, post: @post).destroy
		else
			Like.create(user: current_user, post: @post)
		end
	end
end
